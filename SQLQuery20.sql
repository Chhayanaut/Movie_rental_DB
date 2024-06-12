-- Test the AddMember stored procedure
EXEC AddMember
    @Name = 'Test User',
    @Email = 'test.user@example.com',
    @Phone = '555-1234',
    @Address = '123 Test St',
    @MembershipDate = '2024-12-31';
