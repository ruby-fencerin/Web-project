// тестова "база от данни" - обекти STUDENTS, TEACHERS и EVENTS

const STUDENTS = {
    1: {
        name: "Ана Петрова",
        fn: "1MI0800181",
        email: "ana.petrova@gmail.com"
    },
    2: {
        name: "Борис Велинов",
        fn: "1MI0800182",
        email: "boris.velinov@gmail.com"
    },
    3: {
        name: "Весела Иванова",
        fn: "1MI0800183",
        email: "vesela.ivanova@gmail.com"
    },
    4: {
        name: "Иван Георгиев",
        fn: "1MI0800184",
        email: "ivan.georgiev@gmail.com"
    },
    5: {
        name: "Мария Николова",
        fn: "1MI0800185",
        email: "maria.nikolova@gmail.com"
    },
    6: {
        name: "Георги Димитров",
        fn: "1MI0800186",
        email: "georgi.dimitrov@gmail.com"
    },
    7: {
        name: "Николай Петров",
        fn: "1MI0800187",
        email: "nikolay.petrov@gmail.com"
    },
    8: {
        name: "Силвия Маринова",
        fn: "1MI0800188",
        email: "silvia.marinova@gmail.com"
    },
    9: {
        name: "Петър Стоянов",
        fn: "1MI0800191",
        email: "petar.stoyanov@gmail.com"
    },
    10: {
        name: "Радослав Колев",
        fn: "1MI0800190",
        email: "radoslav.kolev@gmail.com"
    },
    11: {
        name: "Стефанка Манахова",
        fn: "1MI0800189",
        email: "fani.manahova@gmail.com"
    }
};


const TEACHERS = {
    1: { name: "доц. Иван Иванов" },
    2: { name: "гл. ас. Мария Петрова" },
    3: { name: "ас. Георги Георгиев" }
};

const EVENTS = {
    1: {
        type: "lecture",
        title: "Лекция 05.01",
        date: "05.01",
        time: "15:00",
        theme: "Основи на PHP",
        info: "Въведение в PHP, променливи, типове данни и основен синтаксис.",
        teacherId: 1,
        students: [
            "Ана Петрова",
            "Борис Велинов",
            "Весела Иванова",
            "Иван Георгиев",
            "Мария Николова"
        ]
    },

    2: {
        type: "exercise",
        title: "Упражнение 06.01",
        date: "06.01",
        time: "12:00",
        theme: "PHP променливи и оператори",
        info: "Практически задачи с аритметични и логически оператори.",
        teacherId: 3,
        students: [
            "Георги Димитров",
            "Николай Петров",
            "Силвия Маринова"
        ]
    },

    3: {
        type: "lecture",
        title: "Лекция 07.01",
        date: "07.01",
        time: "10:00",
        theme: "Условни конструкции",
        info: "if, else, elseif, switch и добри практики.",
        teacherId: 1,
        students: [
            "Ана Петрова",
            "Мария Николова",
            "Петър Стоянов",
            "Радослав Колев"
        ]
    },

    4: {
        type: "exercise",
        title: "Упражнение 08.01",
        date: "08.01",
        time: "18:00",
        theme: "Условни конструкции – задачи",
        info: "Решаване на практически задачи с if и switch.",
        teacherId: 3,
        students: [
            "Борис Велинов",
            "Весела Иванова",
            "Силвия Маринова"
        ]
    },

    5: {
        type: "lecture",
        title: "Лекция 09.01",
        date: "09.01",
        time: "11:00",
        theme: "Цикли в PHP",
        info: "for, while, do-while и foreach.",
        teacherId: 2,
        students: [
            "Иван Георгиев",
            "Мария Николова",
            "Георги Димитров",
            "Петър Стоянов",
            "Радослав Колев"
        ]
    },

    6: {
        type: "exercise",
        title: "Упражнение 11.01",
        date: "11.01",
        time: "15:00",
        theme: "Цикли – упражнения",
        info: "Практика с for и while чрез реални задачи.",
        teacherId: 3,
        students: [
            "Ана Петрова",
            "Борис Велинов"
        ]
    },

    7: {
        type: "lecture",
        title: "Лекция 13.01",
        date: "13.01",
        time: "08:00",
        theme: "Масиви в PHP",
        info: "Индексирани, асоциативни и многомерни масиви.",
        teacherId: 2,
        students: [
            "Мария Николова",
            "Весела Иванова",
            "Петър Стоянов",
            "Николай Петров"
        ]
    },

    8: {
        type: "exercise",
        title: "Упражнение 14.01",
        date: "14.01",
        time: "09:00",
        theme: "Работа с масиви",
        info: "foreach, array функции и задачи с масиви.",
        teacherId: 3,
        students: [
            "Георги Димитров",
            "Иван Георгиев",
            "Радослав Колев"
        ]
    },

    9: {
        type: "lecture",
        title: "Лекция 14.01",
        date: "14.01",
        time: "16:00",
        theme: "Функции в PHP",
        info: "Създаване и извикване на функции, параметри и return.",
        teacherId: 1,
        students: [
            "Стефанка Манахова",
            "Ана Петрова",
            "Борис Велинов"
        ]
    },

    10: {
        type: "exercise",
        title: "Упражнение 15.01",
        date: "15.01",
        time: "10:00",
        theme: "Функции – упражнения",
        info: "Практически задачи с функции и масиви.",
        teacherId: 3,
        students: [
            "Стефанка Манахова",
            "Мария Николова"
        ]
    },

    11: {
        type: "lecture",
        title: "Лекция 15.01",
        date: "15.01",
        time: "13:00",
        theme: "Файлове в PHP",
        info: "Четене и запис на файлове, fopen, fread, fwrite.",
        teacherId: 2,
        students: [
            "Иван Георгиев",
            "Стефанка Манахова"
        ]
    },

    12: {
        type: "exercise",
        title: "Упражнение 16.01",
        date: "16.01",
        time: "11:00",
        theme: "Файлове – упражнения",
        info: "Задачи за четене и запис на файлове.",
        teacherId: 3,
        students: [
            "Мария Николова",
            "Стефанка Манахова",
            "Георги Димитров"
        ]
    }
};
