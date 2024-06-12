document.getElementById('addMemberForm').addEventListener('submit', async function(event) {
    event.preventDefault();

    const memberData = {
        name: document.getElementById('name').value,
        email: document.getElementById('email').value,
        phone: document.getElementById('phone').value,
        address: document.getElementById('address').value,
        membershipDate: document.getElementById('membershipDate').value
    };

    const response = await fetch('/api/members', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(memberData)
    });

    if (response.ok) {
        alert('Member added successfully!');
    } else {
        alert('Failed to add member.');
    }
});

document.getElementById('addRentalForm').addEventListener('submit', async function(event) {
    event.preventDefault();

    const rentalData = {
        movieId: document.getElementById('movieId').value,
        memberId: document.getElementById('memberId').value,
        rentalDate: document.getElementById('rentalDate').value,
        dueDate: document.getElementById('dueDate').value
    };

    const response = await fetch('/api/rentals', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(rentalData)
    });

    if (response.ok) {
        alert('Rental registered successfully!');
    } else {
        alert('Failed to register rental.');
    }
});
