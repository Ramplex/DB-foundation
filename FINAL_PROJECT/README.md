# Nully Task Management Application

This repository contains all the documentation and scripts related to the Nully task management application project.

## Repository Content

### Main Files

1. **Project Paper** - Detailed description of the Nully project.
2. **Business Model** - Business model for the Nully application.
3. **Poster** - Promotional poster for the Nully application.
4. **Technical Report** - Technical decisions regarding the Nully application.
5. **User Stories** - User stories for the Nully application.

### Folders

#### `db_design`

- **ER Diagram** - Entity-Relationship diagram of the Nully database.
- **Tables Metadata** - PDF with the metadata of the database tables.
- **Relationships Definition** - Definition of the relationships between tables in PDF format.

#### `src`

This folder contains the scripts and configurations needed to interact with the database.

- **Requirements** - `requirements.txt` file with the requirements to perform CRUD operations on the database using Postman.

##### Subfolders in `src`:

- **CRUD Scripts**: Contains scripts for CRUD operations in MySQL and PostgreSQL.
  - `MySQL`
  - `PostgreSQL`

- **DB Scripts**: Contains the database scripts and additional queries.
  - **MySQL**:
    - `Nully_DB.sql`
    - `triggers.sql`
    - `procedures.sql`
    - `populate_nully.sql`
  - **PostgreSQL**:
    - `Nully_DB.sql`
    - `triggers.sql`
    - `procedures.sql`

## Usage Instructions

### Requirements

To run the scripts and use the Nully application, make sure you have the following software and tools installed:

- MySQL
- PostgreSQL
- Postman
- [Complete list in `requirements.txt`](src/requirements.txt)

### Database Setup

1. **Create the database schema**:
   - Run the corresponding script for MySQL or PostgreSQL found in the `db_scripts` folder.

2. **Populate the database**:
   - Use the data population script (`populate_nully.sql`).

3. **Configure triggers and procedures**:
   - Execute the triggers and procedures scripts.

### CRUD Operations

To perform CRUD operations, follow the instructions provided in the `requirements.txt` file and use the scripts in the `CRUD Scripts` subfolder.


---

**Nully Task Management Application**  
Version 1.0.0

