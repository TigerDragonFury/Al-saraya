-- Add image_url column to products table
ALTER TABLE products ADD COLUMN IF NOT EXISTS image_url TEXT;

-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    icon VARCHAR(10),
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Insert default categories
INSERT INTO categories (name, slug, icon, description) VALUES
('Raw Meat', 'raw-meat', '🥩', 'Fresh cuts of various meats'),
('Bowels', 'bowels', '🫀', 'Offal and organ meats'),
('Trays', 'trays', '🍽️', 'Pre-packaged meat trays'),
('Appetizers', 'appetizers', '🥟', 'Ready-to-cook appetizers'),
('Lamb', 'lamb', '🍖', 'Lamb and mutton products'),
('Beef', 'beef', '🥩', 'Premium beef cuts'),
('Chicken', 'chicken', '🍗', 'Poultry products'),
('Skewers', 'skewers', '🍢', 'Marinated skewers'),
('Boxes', 'boxes', '📦', 'Value pack boxes'),
('Local Veal', 'local-veal', '🐄', 'Fresh local veal'),
('Specialty', 'specialty', '⭐', 'Specialty items'),
('Marinated', 'marinated', '🌶️', 'Pre-marinated meats')
ON CONFLICT (slug) DO NOTHING;
