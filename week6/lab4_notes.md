In Part 4, I received MySQL Error 1451 when I attempted to delete the Library and Information Science department.

MySQL refused to delete the department because a student record was still referencing it through a foreign key relationship.

I fixed the problem by first updating the student's department to Software Engineering. After moving the student, I successfully deleted the Library and Information Science department.

Another possible solution would be to use ON DELETE CASCADE when defining the foreign key. This would automatically delete dependent student records when the department is deleted. However, this could result in unintended data loss.