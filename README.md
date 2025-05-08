# TH1-OpenAPI

This repository contains the OpenAPI specification for the TH1 API.

- Backend: [TH1 Server](https://github.com/uol-esis/TH1)
- Frontend:
    - [JavaScript Client](https://github.com/uol-esis/TH1-JS-Client)

---

# 📚 OpenAPI Bundling with `openapi-generator-cli`

This project uses a **modular structure** for the OpenAPI specification:  
The OpenAPI definition is **split across multiple files** to improve **readability**, **maintainability**, and **team
collaboration**.

To generate a complete OpenAPI document from these modular files, we use
[`openapi-generator-cli`](https://openapi-generator.tech/docs/generators/openapi-yaml) to **bundle**
them together into a single file.

---

## 🚀 Purpose

- **Split**: Maintain a modular, easy-to-read OpenAPI structure during development.
- **Bundle**: Generate a single OpenAPI file (`openapi.yaml`) for production, validation, and documentation purposes.

---

## 📁 Project Structure Example

```plaintext
openapi/
├── src/
│   ├── openapi.yaml       # Main entry-point file, references other files
│   ├── paths/
│   │   ├── table-structures.yaml
│   │   └── converter.yaml
│   └── components/
│       └── schemas/
│           ├── table-structure.yaml
│           └── converter.yaml
└── openapi.yaml           # → Generated bundled OpenAPI file
```

- `src/openapi.yaml` contains `$ref` references to the modular files.
- `openapi.yaml` is the final bundled version, ready for deployment and documentation.

---

## 🔧 Prerequisites

- **Docker**

---

## 🔄 Workflow

Follow these steps during development:

### 1️⃣ ✏️ Edit the Modular Files

Edit or extend the OpenAPI files inside `src/`, e.g., in `paths/` or `components/`.

---

### 2️⃣ 📦 Bundle into a Single File

Bundle the modular files into a single OpenAPI document:

```bash
./bundle.sh
```

---

### 3️⃣ ✅ Validate the Bundled File (Optional but Recommended)

Validate the generated `openapi.yaml` to ensure compliance with the OpenAPI standard:

```bash
./validate.sh
```

---

## 📌 Important Notes

- **Do not edit** the bundled `openapi.yaml` manually.  
  Always modify the source files in `src/` and re-bundle.
- If you encounter errors like "`Cannot resolve reference`":
    - Verify `$ref` paths and filenames.
    - Make sure that all `$ref` links use **correct relative paths** across your files.

---
