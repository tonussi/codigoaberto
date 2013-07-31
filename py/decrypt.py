# -- coding: utf-8

""" A simple PDF accessibility checking WAM

Creation: Anand B Pillai <abpillai at gmail dot com> April 27 2007

Modification History

Anand April 27 07   Added more exception handling. Fixed a
                    problem in pyPdf which was not reading
                    certain encrypted PDF docs.

"""


from pyPdf import PdfFileReader
from pdfAWAMHandler import PdfAWAMHandler
from pdfStructureMixin import PdfStructureMixin
import sys 

class DecryptionFailedException(Exception):
    pass

__author__ = "Anand B Pillai"
__maintainer__ = "Lucas Tonussi"
__version__ = "0.1"

def init(self, stream, password=''):
    """ Function which overrides '__init__' of PdfFileReader class """

    # Our init accepts the password and does
    # decryption inline in the read method.
    self.flattenedPages = None
    self.resolvedObjects = {}
    # In pdf.py the read happens before the following
    # 2 initializations. But we need to switch the order.
    self.stream = stream
    self._override_encryption = False
    self.read(stream, password)

def read(self, stream, password=''):
    """ Function which overrides 'read' of PdfFileReader class """

    PdfFileReader.read2(self, stream)
    PdfStructureMixin.read(self, stream)
    # Decrypt automatically with password
    if self.getIsEncrypted():
        print 'Document is encrypted. Trying to decrypt...'
        ret = self.decrypt(password)
        if ret:
            print 'Document decryption success.'
        else:
            print 'Document decryption failed.'
            raise DecryptionFailedException

    # Fill in document information
    self.fillInfo()
    # Set the root object
    self.root =  self.trailer['/Root'].getObject()

# Mix in pdfAWAMHandler functionality to pdfobj
if not PdfStructureMixin in PdfFileReader.__bases__:
    PdfFileReader.__bases__ += (PdfStructureMixin,)
    setattr(PdfFileReader, 'read2', PdfFileReader.read)
    setattr(PdfFileReader, 'read', read)
    # Override __init__ of PdfFileReader
    setattr(PdfFileReader, '__init__', init)

def extractAWAMIndicators(pdf, password=''):
    """ Check whether the given PDF document is accessible """

    # Takes an optional password which can be used to
    # unlock the document for encrypted documents.
    try:
        pdfobj = PdfFileReader(pdf, password)
        print 'Producer=>',pdfobj.producer
        print 'Creator=>',pdfobj.creator
    except DecryptionFailedException:
        # We are unable to decrypt document.
        # We have got no parsed pdfobj, and cannot do much more,
        # unfortunately... 
        # Tell that the document was not accessible due to encryption, at least
        print "Decryption failed"
        return {'EIAO.A.10.8.1.4.PDF.1.1':{(0, 1): 0}}
    except NotImplementedError:
        # pyPdf only supports algorithm version 1 and 2. 
        # Version 3 and 4 are not yet supported.
        print "Unsupported decryption algorithm."
        return {'EIAO.A.10.8.1.4.PDF.1.1':{(0, 1): 0}}


    try:
        # Fix indirect object references
        pdfobj.fixIndirectObjectXref()

        structTreeRoot=pdfobj.root['/StructTreeRoot'].getObject()
        roleMap=structTreeRoot['/RoleMap'].getObject()
    except (KeyError, ValueError), e:
        roleMap=None

    awamHandler=PdfAWAMHandler(roleMap=roleMap,debug=0)
    pdfobj.processAWAM(awamHandler)
    return awamHandler.resultMap
