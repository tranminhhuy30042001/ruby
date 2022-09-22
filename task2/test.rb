require "pg"
require "postgres-copy"
require 'csv'

conn = PG.connect("localhost", 5432, "", "", "postgres")

#p res = conn.exec("select * from user;")


sql = "\\copy tb_data (name, email, phone, address, date, profile) FROM '/home/tranminhhuy/vscode/task/task2/user_data.csv' DELIMITER ',' CSV;";

res = conn.exec(sql)



