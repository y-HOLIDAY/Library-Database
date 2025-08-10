--@Yo Mothowamodimo
-- Queries used to test out the database

-- Selects all Books and their authors
SELECT B.BookTitle, A.FirstName, A.LastName
FROM BOOK B
JOIN AUTHOR A ON B.AuthorID = A.AuthorID;

-- Lists all members of library and the books they loaned
SELECT M.FirstName, M.LastName, B.BookTitle, L.LoanDate, L.ReturnDate
FROM MEMBERS M
JOIN LOAN L ON M.MembersID = L.MembersID
JOIN BOOK B ON L.BookID = B.BookID;

-- List Staff and which branch they work at
SELECT S.StaffName, S.StaffSurname, B.Branchname
FROM STAFF S
JOIN BRANCHES B ON S.BranchID = B.BranchID;

-- List the names of members who have overdue loans
SELECT M.FirstName, M.LastName, B.BookTitle, L.ReturnDate
FROM LOAN L
JOIN MEMBERS M ON L.MembersID = M.MembersID
JOIN BOOK B ON L.BookID = B.BookID
WHERE L.ReturnDate < '2025-06-17';

-- removed BOOKALLOCATION table as it violates BNCF
