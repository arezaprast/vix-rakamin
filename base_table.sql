-- Create Base Table
CREATE TABLE base_table AS(
SELECT
 CONCAT(sale.id_invoice, sale.id_barang) AS id_penjualan,
 cust.id_customer,
 sale.id_invoice,
 sale.id_distributor,
 str_to_date(sale.tanggal, "%d/%m/%Y") tanggal,
 sale.brand_id,
 item.lini,
 sale.id_barang,
 item.nama_barang,
 item.nama_tipe,
 sale.jumlah_barang,
 item.kemasan,
 sale.harga,
 sale.unit,
 sale.id_cabang,
 cust.nama,
 cust.level,
 cust.cabang_sales,
 cust.group AS grup
FROM penjualan AS sale
LEFT JOIN barang AS item ON sale.id_barang = item.kode_barang
LEFT JOIN pelanggan AS cust ON sale.id_customer = cust.id_customer
);

-- Determine Primary Key
ALTER TABLE base_table ADD PRIMARY KEY(id_penjualan);
