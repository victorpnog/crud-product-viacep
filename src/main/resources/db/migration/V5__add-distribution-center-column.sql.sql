-- add a coluna
ALTER TABLE product ADD COLUMN distribution_center VARCHAR(100);

-- Mogi das Cruzes: primeiros produtos
UPDATE product
SET distribution_center = 'Mogi das Cruzes'
WHERE id IN (SELECT id FROM product ORDER BY id LIMIT 2);

-- Recife: próximos produtos
UPDATE product
SET distribution_center = 'Recife'
WHERE id IN (SELECT id FROM product ORDER BY id LIMIT 2 OFFSET 2);

-- Porto Alegre: todos os restantes
UPDATE product
SET distribution_center = 'Porto Alegre'
WHERE id IN (SELECT id FROM product ORDER BY id LIMIT 1000 OFFSET 4);