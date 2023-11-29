package dao;

import entity.Expense;
import entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class ExpenseDao {
    private SessionFactory factory = null;
    private Session session = null;
    private Transaction transaction = null;

    public ExpenseDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveExpense(Expense expense){
        boolean f = false;

        try{
            session = factory.openSession();
            transaction = session.beginTransaction();
            session.save(expense);
            transaction.commit();
            f = true;
        }catch(Exception e){
            if(transaction != null){
                f = false;
                e.printStackTrace();
            }
        }
        return f;
    }

    public List<Expense> getAllExpenses(User user){
        List<Expense> list = new ArrayList<>();
        try {
            session = factory.openSession();
            Query query = session.createQuery("from Expense where user=:user");
            query.setParameter("user", user);
            list = query.list();

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public Expense getExpenseById(int id){
        Expense expense = null;

        try{
            session = factory.openSession();
            Query query = session.createQuery("from Expense where id=:id");
            query.setParameter("id", id);
            expense = (Expense) query.uniqueResult();

        }catch (Exception e){
            e.printStackTrace();
        }
        return expense;
    }

    public boolean updateExpense(Expense expense){
        boolean f = false;

        try{
            session = factory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(expense);
            transaction.commit();
            f = true;
        }catch(Exception e){
            if(transaction != null){
                f = false;
                e.printStackTrace();
            }
        }
        return f;
    }

    public boolean deleteExpense(int id){
        boolean f = false;
        try{
            session = factory.openSession();
            transaction = session.beginTransaction();
            Expense expense = session.get(Expense.class, id);
            session.delete(expense);
            transaction.commit();
            f = true;
        }catch(Exception e){
            if(transaction != null){
                f = false;
                e.printStackTrace();
            }
        }
        return f;
    }
}
