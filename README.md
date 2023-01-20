# RepoXml

Identify, parse and persist in database XML (NFe and CTe).

## Run Locally

Clone the project

```bash
  git clone https://github.com/marco-a-ferraz/repo_xml.git
```

Go to the project directory

```bash
  cd repo_xml
```

Run docker

```bash
  docker-compose build
```

Setup database

```bash
  docker-compose exec app mix ecto.setup
```

Start the server
```bash
  docker-compose up
```

## API Reference

#### Create a document

```http
  POST /api/v1/import_xml
```

| Param   | Type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `data` | `string` | **Required**. Base64 of an XML file |


#### Get all CTe

```http
  GET /api/v1/ctes
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `key`      | `string` |   |
| `number`      | `string` |   |
| `authorized` | `boolean` | |
| `issuer_cnpj` | `string` | Only the number, e.g "000000000000"|


#### Get CTe

```http
  GET /api/v1/ctes/${id}
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Required**. The ID of the record you want |

#### Delete CTe

```http
  DELETE /api/v1/ctes/${id}
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Required**. The ID of the record you want |

#### Get all NFe

```http
  GET /api/v1/nfes
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `key`      | `string` |   |
| `number`      | `string` |   |
| `issuer_cnpj` | `string` | Only the number, e.g "000000000000"|


#### Get NFe

```http
  GET /api/v1/nfes/${id}
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Required**. The ID of the record you want |

#### Delete NFe

```http
  DELETE /api/v1/nfes/${id}
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Required**. The ID of the record you want |



## Tech Stack

* **Back-end:** Elixir, Phoenix
* **Database:** PostgreSQL


## To do
- [x]   Identify types of XML
- [x]   Parse CTe and persist in database
- [x]   Parse NFe and persist in database
- [ ]   API Authentication
- [ ]   Upload files to S3 Bucket