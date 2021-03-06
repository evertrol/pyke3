# $Id: create_tables.sql c0848aaeaad7 2008-03-03 mtnyogi $
#
# Copyright © 2008 Bruce Frederiksen
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

create table if not exists movie (
    id int not null auto_increment primary key,
    title varchar(100),
    genre_id int not null references genre (id),
    year year,
    length time
) type=InnoDB;

create table if not exists genre (
    id int not null auto_increment primary key,
    genre_name varchar(100),
    unique (genre_name)
) type=InnoDB;

create table if not exists director (
    id int not null auto_increment primary key,
    director_name varchar(100),
    unique (director_name)
) type=InnoDB;

create table if not exists movie_director_link (
    movie_id int not null references movie(id),
    director_id int not null references director(id),
    billing int not null default 1,
    primary key (movie_id, director_id)
) type=InnoDB;

create table if not exists catalog (
    movie_id int not null references movie(id),
    dvd_number int not null,
    selection_number int not null default 1,
    primary key (movie_id, dvd_number, selection_number)
) type=InnoDB;

