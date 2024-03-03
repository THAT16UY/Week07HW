drop table if exists step;
drop table if exists material;
drop table if exists project_category;
drop table if exists category;
drop table if exists project;


CREATE table project(
project_id INT auto_increment not null,
project_name VARCHAR(128) not null,
estimated_hours DECIMAL(7, 2),
actual_hours DECIMAL(7, 2),
difficulty INT,
notes TEXT,
primary key(project_id)
);

create table category(
category_id INT auto_increment not null,
category_name VARCHAR(128) not null,
primary key(category_id)
);

create table project_category(
project_id INT not null,
category_id INT not null,
foreign key (project_id) references project (project_id) on delete cascade,
foreign key (category_id) references category (category_id) on delete cascade 
);

create table material(
material_id INT auto_increment not null,
project_id INT not null,
material_name VARCHAR(128) not null,
num_required INT,
cost DECIMAL(7, 2),
primary key (material_id),
foreign key (project_id) references project (project_id) on delete cascade
);

create table step(
step_id INT auto_increment not null,
project_id INT not null,
step_text TEXT not null,
step_order INT not null,
primary key (step_id),
foreign key (project_id) references project (project_id) on delete cascade
);