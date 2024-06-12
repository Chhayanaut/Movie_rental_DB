const express = require('express');
const bodyParser = require('body-parser');
const sql = require('mssql');

const app = express();
app.use(bodyParser.json());
app.use(express.static('public'));  // Serve static files from the 'public' directory

const dbConfig = {
    user: 'your_db_user',
    password: 'your_db_password',
    server: 'your_db_server',
    database: 'movie_rental_DB',
    options: {
        encrypt: false, // Set to true if using Azure
        enableArithAbort: true
    }
};

// Connect to the database
sql.connect(dbConfig, (err) => {
    if (err) {
        console.error('Database connection failed:', err);
    } else {
        console.log('Connected to database.');
    }
});

app.post('/api/members', async (req, res) => {
    const { name, email, phone, address, membershipDate } = req.body;

    try {
        const request = new sql.Request();
        await request
            .input('Name', sql.NVarChar, name)
            .input('Email', sql.NVarChar, email)
            .input('Phone', sql.NVarChar, phone)
            .input('Address', sql.NVarChar, address)
            .input('MembershipDate', sql.Date, membershipDate)
            .execute('AddMember');

        res.status(200).send('Member added successfully.');
    } catch (err) {
        console.error('Error adding member:', err); // Log the detailed error
        res.status(500).send('Failed to add member.');
    }
});

app.post('/api/rentals', async (req, res) => {
    const { movieId, memberId, rentalDate, dueDate } = req.body;

    try {
        const request = new sql.Request();
        await request
            .input('MovieID', sql.Int, movieId)
            .input('MemberID', sql.Int, memberId)
            .input('RentalDate', sql.Date, rentalDate)
            .input('DueDate', sql.Date, dueDate)
            .execute('AddRental');

        res.status(200).send('Rental registered successfully.');
    } catch (err) {
        console.error('Error registering rental:', err); // Log the detailed error
        res.status(500).send('Failed to register rental.');
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
