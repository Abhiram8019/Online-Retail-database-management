# Online-Retail-database-management

# Database Schema Overview

## Database: `Online_RetailDB`

All operations are conducted within the `Online_RetailDB` schema.

---

## Tables

### 1. Customers Table

**Description**: Holds customer details.

**Fields**:

- `customer_id` (Primary Key, Auto-Increment)
- `first_name`
- `last_name`
- `email`
- `phone`
- `address`
- `city`
- `state`
- `zipcode`
- `country`
- `created_at`

---

### 2. Products Table

**Description**: Contains product details.

**Fields**:

- `product_id` (Primary Key, Auto-Increment)
- `product_name`
- `category_id` (Foreign Key to `Categories.category_id`)
- `price`
- `stock`
- `created_at`

---

### 3. Categories Table

**Description**: Stores product categories.

**Fields**:

- `category_id` (Primary Key, Auto-Increment)
- `category_name`
- `description`

---

### 4. Orders Table

**Description**: Records customer orders.

**Fields**:

- `order_id` (Primary Key, Auto-Increment)
- `customer_id` (Foreign Key to `Customers.customer_id`)
- `order_date`
- `total_amount`

---
## Schema Description
A straightforward relational database structure for handling retail operations, including customers, products, categories, and orders, is represented by this schema. It adheres to best practices like:


Primary keys are distinct identifiers that are automatically assigned to each record in a table using auto-increment.
Foreign Keys: To preserve referential integrity, create associations between tables.
