package dao;

import entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory = null;
    private Session session = null;
    private Transaction transaction = null;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveUser(User user){
        boolean f = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            session.save(user);
            transaction.commit();
            f=true;

        }catch( Exception e){
            if(transaction != null) {
                f = false;
                e.printStackTrace();
            }
        }
        return f;
    }

    public User login(String email, String password){
        User user = null;
        session = factory.openSession();
        Query query = session.createQuery("from User where email=:em and password=:ps");
        query.setParameter("em", email);
        query.setParameter("ps", password);

        user = (User)query.uniqueResult();

        return user;
    }
}
