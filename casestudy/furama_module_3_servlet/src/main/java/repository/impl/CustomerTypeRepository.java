package repository.impl;

import model.Customer;
import model.CustomerType;
import repository.BaseRepository;
import repository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {

    private static final String SELECT_ALL_CUSTOMER_TYPE = "select * from customer_type";

    @Override
    public List<CustomerType> selectAllCustomerType() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");

                customerTypes.add(new CustomerType(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypes;
    }
}
