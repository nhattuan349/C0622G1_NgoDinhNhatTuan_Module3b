package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productList = new HashMap<>();

    static {
        Product product1 = new Product(1, "Curtiss Warhawk 2018", 105000, 35, "động cơ V-twin, dung tích 2.163cc");
        Product product2 = new Product(2, "Flathead của Olson Auto", 200000, 50, "động cơ Flathead V8 của Ford");
        Product product3 = new Product(3, "Dodge Tomahawk", 555000, 10, "động cơ V10 8,3 lít, kết cấu 4 bánh");
        Product product4 = new Product(4, "Van Veen OCR1000", 105000, 38, "107 mã lực");
        Product product5 = new Product(5, "Track T800-CDi", 50000, 100, "khung gầm của KTM 900 Adventure");
        Product product6 = new Product(6, "Dark Side", 300000, 1, " Bandit9 Dark Side hoàn hảo tới từng chi tiết");
        Product product7 = new Product(7, "Yamaha V-Max", 115000, 1, "Chiếc xe được đưa về Việt Nam ");
        productList.put(product1.getId(), product1);
        productList.put(product2.getId(), product2);
        productList.put(product3.getId(), product3);
        productList.put(product4.getId(), product4);
        productList.put(product5.getId(), product5);
        productList.put(product6.getId(), product6);
        productList.put(product7.getId(), product7);
    }



    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void create(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public void edit(int id, Product product) {
        productList.put(id, product);
    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products = new ArrayList<>();
        for (Product item : findAll()) {
            if (item.getName().contains(name)) {
                products.add(item);
            }
        }
        return products;
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public Integer checkId() {
        int max = productList.get(0).getId();
        for (int i = 1; i <productList.size() ; i++) {
            if (max < productList.get(i).getId()) {
                max = productList.get(i).getId();
            }
        }
        return max + 1;
    }
}
