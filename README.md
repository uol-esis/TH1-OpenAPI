# TH1-OpenAPI

This repository contains the OpenAPI specification for the TH1 API.

- [TH1 Server](https://github.com/uol-esis/TH1)
- [JavaScript Client](https://github.com/uol-esis/TH1-JS-Client)

---

# 📚 OpenAPI Bundling with `swagger-cli`

This project uses a **modular structure** for the OpenAPI specification:  
The OpenAPI definition is **split across multiple files** to improve **readability**, **maintainability**, and **team
collaboration**.

To generate a complete OpenAPI document from these modular files, we use [
`swagger-cli`](https://github.com/APIDevTools/swagger-cli) to **bundle** them together into a single file.

---

## 🚀 Purpose

- **Split**: Maintain a modular, easy-to-read OpenAPI structure during development.
- **Bundle**: Generate a single OpenAPI file (`openapi.yaml`) for production, validation, and documentation purposes.

---

## 📁 Project Structure Example

```plaintext
openapi/
├── src/                  # Quelle (wird nicht direkt deployed)
│   ├── openapi.yaml       # Main entry-point file, references other files
│   ├── paths/
│   │   ├── table-structures.yaml
│   │   └── converter.yaml
│   └── components/
│       ├── schemas.yaml
│       └── responses.yaml
├── openapi.yaml           # → Generated bundled OpenAPI file
```

- `src/openapi.yaml` contains `$ref` references to the modular files.
- `openapi.yaml` is the final bundled version, ready for deployment and documentation.

---

## 🔧 Prerequisites

- **Node.js** installed (version 12+ recommended)
- **swagger-cli** installed globally:

```bash
  npm install -g swagger-cli
```

---

## 🔄 Workflow

Follow these steps during development:

### 1️⃣ ✏️ Edit the Modular Files

Edit or extend the OpenAPI files inside `src/`, e.g., in `paths/` or `components/`.

---

### 2️⃣ 📦 Bundle into a Single File

Bundle the modular files into a single OpenAPI document:

```bash
  swagger-cli bundle src/openapi.yaml --outfile openapi.yaml --type yaml
```

| Part                     | Description                                               |
|:-------------------------|:----------------------------------------------------------|
| `swagger-cli bundle`     | Starts the bundling process                               |
| `src/openapi.yaml`       | Entry point referencing the modular files                 |
| `--outfile openapi.yaml` | Output location for the bundled file                      |
| `--type yaml`            | Output format (`yaml`; alternatively, `json` is possible) |

---

### 3️⃣ ✅ Validate the Bundled File (Optional but Recommended)

Validate the generated `openapi.yaml` to ensure compliance with the OpenAPI standard:

```bash
  swagger-cli validate openapi.yaml
```

---

## 📌 Important Notes

- **Do not edit** the bundled `openapi.yaml` manually.  
  Always modify the source files in `src/` and re-bundle.
- If you encounter errors like "`Cannot resolve reference`":
    - Verify `$ref` paths and filenames.
    - Make sure that all `$ref` links use **correct relative paths** across your files.

---

### ➡️ Example Quick Command

If you just want to quickly bundle and validate:

```bash
  swagger-cli bundle src/openapi.yaml --outfile openapi.yaml --type yaml && swagger-cli validate openapi.yaml
```