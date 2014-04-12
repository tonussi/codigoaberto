import de.bezier.data.sql.PostgreSQL;
import java.util.List;

PostgreSQL pgsql;
List<PeopleAreAwesome> friends;

void setup() {

  size(350, 200);

  background(255);

  String user = "lucastonussi";
  String pass = "hung4ro5";
  String database = "lucastonussi";

  pgsql = new PostgreSQL(this, "localhost", database, user, pass);

  if (pgsql.connect()) {
    pgsql.query("SELECT COUNT(*) FROM amigos");

    if (pgsql.next())
      println("qnt amigos: " + pgsql.getInt(1));


    pgsql.query("SELECT * FROM amigos LIMIT 10");

    //PeopleAreAwesome paa = new PeopleAreAwesome(pgsql.getBigDecimal("uid"), pgsql.getString("uname"), pgsql.getString("sex"), pgsql.getString("locale"), pgsql.getInt("agerank"));
    friends = new ArrayList<PeopleAreAwesome>();
    while (pgsql.next ())
      friends.add(new PeopleAreAwesome(pgsql.getString("uname"), pgsql.getString("sex"), pgsql.getString("locale"), pgsql.getInt("agerank")));
  }
  pgsql.close();
}

void draw() {
  background(255);
  
  for (PeopleAreAwesome friend : friends)
    friend.display();
}
