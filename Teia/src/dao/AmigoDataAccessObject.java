package dao;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Amigo;
import processing.core.PApplet;

public class AmigoDataAccessObject {

	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
	private String database, user, pass;
	PApplet parent;

	public AmigoDataAccessObject(PApplet p, String database, String user,
			String pass) {
		parent = p;

		this.database = database;
		this.user = user;
		this.pass = pass;

		try {

			connection = connectToDatabaseOrDie(database, user, pass);
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT VERSION()");

			if (resultSet.next())
				System.out.println(resultSet.getString(1));

		} catch (SQLException ex) {

			Logger logger = Logger.getLogger(AmigoDataAccessObject.class
					.getName());
			logger.log(Level.SEVERE, ex.getMessage(), ex);

		} finally {

			try {
				if (resultSet != null)
					resultSet.close();
				if (statement != null)
					statement.close();
				if (connection != null)
					connection.close();

			} catch (SQLException ex) {

				Logger logger = Logger.getLogger(AmigoDataAccessObject.class
						.getName());
				logger.log(Level.WARNING, ex.getMessage(), ex);

			}
		}
	}

	public int quantidadeAmigos() {

		try {

			connection = connectToDatabaseOrDie(database, user, pass);
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT COUNT(*) from amigos");

			if (resultSet.next())
				return resultSet.getInt(1);

		} catch (SQLException ex) {
			Logger lgr = Logger
					.getLogger(AmigoDataAccessObject.class.getName());
			lgr.log(Level.SEVERE, ex.getMessage(), ex);

		} finally {

			try {
				if (resultSet != null)
					resultSet.close();
				if (connection != null)
					connection.close();

			} catch (SQLException ex) {
				Logger lgr = Logger.getLogger(AmigoDataAccessObject.class
						.getName());
				lgr.log(Level.WARNING, ex.getMessage(), ex);
			}
		}

		return 0;
	}

	public void comparaTabelas() {

		try {

			connection = connectToDatabaseOrDie(database, user, pass);
			statement = connection.createStatement();
			resultSet = statement
					.executeQuery("SELECT * FROM amigos INNER JOIN relacoes ON amigos.uid = relacoes.node1");

			while (resultSet.next())
				System.out.println(resultSet.getString(1)
						+ resultSet.getString(2) + resultSet.getString(3));

		} catch (SQLException ex) {
			Logger lgr = Logger
					.getLogger(AmigoDataAccessObject.class.getName());
			lgr.log(Level.SEVERE, ex.getMessage(), ex);

		} finally {

			try {
				if (resultSet != null)
					resultSet.close();
				if (connection != null)
					connection.close();

			} catch (SQLException ex) {
				Logger lgr = Logger.getLogger(AmigoDataAccessObject.class
						.getName());
				lgr.log(Level.WARNING, ex.getMessage(), ex);
			}
		}
	}

	public List<Amigo> listadeAmigos() {

		ArrayList<Amigo> amigos = new ArrayList<Amigo>();

		try {

			connection = connectToDatabaseOrDie(database, user, pass);
			statement = connection.createStatement();
			resultSet = statement
					.executeQuery("SELECT uid, uname, sex, locale, agerank FROM amigos where agerank < 20");

			while (resultSet.next())
				amigos.add(new Amigo(parent, BigInteger.valueOf(Long
						.valueOf(resultSet.getString(1))), resultSet
						.getString(2), resultSet.getString(3), resultSet
						.getString(4), resultSet.getInt(5)));

		} catch (SQLException ex) {
			Logger lgr = Logger
					.getLogger(AmigoDataAccessObject.class.getName());
			lgr.log(Level.SEVERE, ex.getMessage(), ex);

		} finally {

			try {
				if (resultSet != null)
					resultSet.close();
				if (connection != null)
					connection.close();

			} catch (SQLException ex) {
				Logger lgr = Logger.getLogger(AmigoDataAccessObject.class
						.getName());
				lgr.log(Level.WARNING, ex.getMessage(), ex);
			}
		}

		return amigos;
	}

	public Connection connectToDatabaseOrDie(String database, String user,
			String pass) {
		Connection conn = null;
		try {
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://localhost/" + database;
			conn = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException e) {
			Logger logger = Logger.getLogger(AmigoDataAccessObject.class
					.getName());
			logger.log(Level.SEVERE, e.getMessage(), e);
			System.exit(1);
		} catch (SQLException e) {
			Logger logger = Logger.getLogger(AmigoDataAccessObject.class
					.getName());
			logger.log(Level.SEVERE, e.getMessage(), e);
			System.exit(2);
		}
		return conn;
	}
}
