
# RepoXml

Identify, parse and persist in database XML (NFe and CTe).


## Doc

#### Create a document

```http
  POST /api/import_xml
```

| Param   | Type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `data` | `string` | **Required**. Base64 of an XML file |


#### Return a list of CTes

```http
  GET /api/ctes
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `key`      | `string` |   |
| `number`      | `string` |   |
| `authorized` | `boolean` | |
| `issuer_cnpj` | `string` | Only the number, e.g "000000000000"|


#### Return one CTe

```http
  GET /api/ctes/${id}
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Required**. The ID of the record you want |

#### Update one CTe

```http
  PATCH /api/ctes/${id}
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Required**. The ID of the record you want |
| `authorized` | `boolean` | **Optional** |



## Stack utilizada

* **Back-end:** Elixir, Phoenix
* **Database:** PostgreSQL

