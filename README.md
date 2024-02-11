# Нормализация базы данных из файла
## 1 НФ
Данные из файла в целом находятся в первой нормальной форме, исключением может быть только поле адрес у клиента, там величинана не атомарная, а комбинация улица плюс дом.
Необходимость детализировать адрес сильно зависит от бизнес контекста задачи, в некоторых случаях не требуется сильно детализировать, но давайте в нашем случае разобъем
Так же стоить заметить что почтовый индекс зависит от улицы и дома, улица и дом от города, город от страны, поэтому их можно преобрвзовать в цепочку таблиц, а пользователь может хранить только номер улицы и дома

![image](https://github.com/Karina1605/database_akchurina/assets/56845814/7ceac058-55f6-4c7a-bb96-de32ac5b9d70)

Нормализация адреса породила таблицы представленные на скрине.

## 2 НФ
После преобразования адреса мы польностью привели наши таблицы в 1-ую нормальную форму, каждое поле атомарно. Таблицы не находятся во второй нормальной форме, тк в них пристуствуют поля, которые не зависят от покупателя, или транзакции.
Например, такие поля как бренд, размеры продукта, линия выпуска это атрибуты продукта, а не транзакции. Для этого создадим таблицу product и вынесем в нее все атрибуты продукта. Таким образом мы пришли к тому что у нас увеличилось кол-во сущностей, каждая из которых содержит информацию к ней привязнуую


## 3 НФ
В предсталенных таблицах много полей имеет ограниченный набор значений, которые зависят от наших основных сущностей, но также имют ограниченный набор значений, вынесем их в отдельные таблицы-справочники
