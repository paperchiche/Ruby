use students;

create table if not exists student(
    id INT primary key not null auto_increment,
    surname VARCHAR(50) not null,
    name VARCHAR(50) not null,
    father_name VARCHAR(50) not null,
    phone VARCHAR(50),
    mail VARCHAR(50),
    tg VARCHAR(50),
    git VARCHAR(50)
    );