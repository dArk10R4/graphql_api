import json 
import sqlite3

f = open('data.json','r');

data = json.load(f)['data']

products = data['products']

conn = sqlite3.connect('public/db.sqlite')
cursor = conn.cursor()

cursor.execute("SELECT * FROM products p INNER JOIN category c ON p.category_id = c.id WHERE p.id = 1;")

# Parse the JSON data
# products_data = products

# for product in products_data:
#     # Insert data into the 'products' table
#     category_id = 1 if product['category'] == 'clothes' else 2
#     cursor.execute("INSERT INTO products (query_id, name, inStock, description, brand, category_id) VALUES (?, ?, ?, ?, ?, ?)",
#                    (product['id'], product['name'], 1 if product['inStock'] else 0, product['description'], product['brand'], category_id))  # Assuming category_id for 'clothes' is 1 and 'tech' is 2
    
#     product_id = cursor.lastrowid
    
#     # Insert data into the 'images' table
#     for url in product['gallery']:
#         cursor.execute("INSERT INTO images (url, alt, product_id) VALUES (?, ?, ?)", (url, product['name'], product_id))
    
#     # Insert data into the 'attributes' table
#     # for attribute_set in product['attributes']:
#     #     for attribute in attribute_set['items']:
#     #         cursor.execute("INSERT INTO attributes (query_id, value, displayValue, attribute_set_id) VALUES (?, ?, ?, ?)",
#     #                        (attribute['id'], attribute['value'], attribute['displayValue'], 1))  # Assuming attribute_set_id for 'Size' is 1
    
#     # Insert data into the 'prices' table
#     for price in product['prices']:
#         cursor.execute("INSERT INTO prices (amount, currency_id, product_id) VALUES (?, ?, ?)",
#                        (price['amount'], 1, product_id))  # Assuming currency_id for 'USD' is 1

# Commit changes and close the connection
conn.commit()
conn.close()
