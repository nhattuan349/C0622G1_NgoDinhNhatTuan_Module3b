package repository.impl;

import model.Customer;
import model.CustomerType;
import repository.BaseRepository;
import repository.ICustomerRepository;
import repository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer(customer_type_id,name,date_of_birth,gender,id_card,phone_number,email,address) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select *from customer where id =?";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_type_id = ?,name= ?, date_of_birth= ?, gender= ?, id_card= ?, phone_number= ?, email  =? , address  =?  where id = ?;";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where id = ? ;";
    private static final String SEARCH_CUSTOMER_BY_NAME = "SELECT * FROM customer where name like ? ";


    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);{
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfbirth());
            preparedStatement.setInt(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public List<Customer> selectAllCustomer()  {
        List<Customer> customers = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String dateOfbirth = rs.getString("date_of_birth");
                int gender = rs.getInt("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");

                customers.add(new Customer(id,customerTypeId,name,dateOfbirth,gender,idCard,phoneNumber,email,address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        // Step 1: Establishing a Connection
        try (Connection connection = BaseRepository.getConnectDB();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);) {
            preparedStatement.setInt(1, id);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String dateOfbirth = rs.getString("date_of_birth");
                int gender = rs.getInt("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                customer = new Customer(id, customerTypeId, name, dateOfbirth, gender, idCard, phoneNumber, email, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

        @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
            boolean rowUpdated;
            try (Connection connection = BaseRepository.getConnectDB();
                 PreparedStatement statement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);) {
                statement.setInt(1, customer.getCustomerTypeId());
                statement.setString(2, customer.getName());
                statement.setString(3, customer.getDateOfbirth());
                statement.setInt(4, customer.getGender());
                statement.setString(5, customer.getIdCard());
                statement.setString(6, customer.getPhoneNumber());
                statement.setString(7, customer.getEmail());
                statement.setString(8, customer.getAddress());
                statement.setInt(9, customer.getId());
                rowUpdated = statement.executeUpdate() > 0;
            }
            return rowUpdated;
        }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {

        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
//
    @Override
    public List<Customer> findByName(String nameCustomer) {
        List<Customer> customers = new ArrayList<>();

            Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER_BY_NAME);
            preparedStatement.setString(1,nameCustomer);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String dateOfbirth = rs.getString("date_of_birth");
                int gender = rs.getInt("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");

                customers.add(new Customer(id, customerTypeId,name,dateOfbirth,gender,idCard,phoneNumber,email,address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
}
