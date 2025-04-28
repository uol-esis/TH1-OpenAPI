# TH1-OpenAPI

This repository contains the OpenAPI specification for the TH1 API.

- [TH1 Server](https://github.com/uol-esis/TH1)
- [JavaScript Client](https://github.com/uol-esis/TH1-JS-Client)
---

# 📚 OpenAPI Bundling with `swagger-cli`

This project uses a **modular structure** for the OpenAPI specification:  
The OpenAPI definition is **split across multiple files** to improve **readability**, **maintainability**, and **team collaboration**.

To generate a complete OpenAPI document from these modular files, we use [`swagger-cli`](https://github.com/APIDevTools/swagger-cli) to **bundle** them together into a single file.

---

## 🚀 Purpose

- **Split**: Maintain a modular, easy-to-read OpenAPI structure during development.
- **Bundle**: Generate a single OpenAPI file (`openapi.yaml`) for production, validation, and documentation purposes.

---

## 🔧 Prerequisites

- **Node.js** installed (version 12+ recommended)
- **swagger-cli** installed globally:

```bash
  npm install -g swagger-cli
```

---

## 📦 How to Bundle the OpenAPI Files

To generate a single OpenAPI YAML file from the modular files, run:

```bash
  swagger-cli bundle openapi.yaml --outfile _build/openapi.yaml --type yaml
```

### Command Explanation

| Part | Description |
|:-----|:------------|
| `swagger-cli bundle` | Starts the bundling process |
| `openapi.yaml` | Entry point: the main file that references all others |
| `--outfile _build/openapi.yaml` | Output location for the bundled file |
| `--type yaml` | Output format (alternatively, `json` can be specified) |

---

## 📁 Project Structure Example

```plaintext
openapi/
├── openapi.yaml          # Main entry-point file, references other files
├── paths/
│   ├── users.yaml
│   └── products.yaml
├── components/
│   ├── schemas.yaml
│   └── responses.yaml
_build/
└── openapi.yaml          # → Generated bundled OpenAPI file
```

The `openapi.yaml` in the root folder contains `$ref` references to the individual modular files.

---

## 🔄 Typical Workflow

1. Edit or extend the modular OpenAPI files (`paths/`, `components/`, etc.).
2. Bundle them into a single file by running:

```bash
  swagger-cli bundle openapi.yaml --outfile _build/openapi.yaml --type yaml
```

3. Use the bundled `_build/openapi.yaml` for:
    - Swagger-UI
    - Redoc
    - API documentation hosting
    - Validation and tooling

---

## ⚙️ Optional: Validate the Bundled OpenAPI File

After bundling, it's recommended to validate the generated OpenAPI file:

```bash
  swagger-cli validate _build/openapi.yaml
```

This ensures that the final file is correct and compliant with the OpenAPI specification.

---

## ⚡ Advantages of this Approach

- **Improved readability** for large APIs
- **Better team collaboration** through smaller, logical files
- **Easy deployment** with a single bundled OpenAPI file
- **Simple automation** (e.g., bundling during build pipelines)

---

## 📌 Important Notes

- **Do not edit** the bundled `_build/openapi.yaml` manually.  
  Always make changes in the source modular files and re-bundle.
- If `swagger-cli` throws errors like "`Cannot resolve reference`", double-check the `$ref` paths and spelling.
- Make sure that all `$ref` links use **correct relative paths** across your files.