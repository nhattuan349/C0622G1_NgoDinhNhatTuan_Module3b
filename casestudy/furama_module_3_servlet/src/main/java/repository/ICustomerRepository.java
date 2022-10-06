package repository;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    void insertCustomer(Customer customer) throws SQLException;
    List<Customer> selectAllCustomer();
    Customer selectCustomer(int id);
    boolean updateCustomer(Customer customer) throws SQLException;
    boolean deleteCustomer(int id) throws SQLException;
}
