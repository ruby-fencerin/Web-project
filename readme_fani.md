Това е първоначална версия на html структурата на проекта.

За тестване отворете teacher\_page.html и се движете по менюто и опциите.



**front-end:**



> images

 	unknown.jpg - картинка за анонимен профил



> pages 

 	student\_page.html

 	student\_event\_page.html

 	event\_page\_student\_view.html

 	teacher\_page.html

 	teacher\_event\_page.html

 	event\_page\_teacher\_view.html

 	teacher\_page\_list\_students.html

> js

 	event-details.js

 	events-data.js

 	events-list.js

 	user.js

 	teacher-event-details.js

 	teacher-events-list.js

 	teacher-students-list.js

 	teacher-user.js



>css

 	page\_styles.css



**events-data.js**

Временна hardcoded мини база от данни - обекти STUDENTS, TEACHERS и EVENTS - всеки с ключове id и стойности - обекти с необходимите полета.



**student\_page.html**

Страницата "за мен" на студент. Засега има само лична информация, не съм слагала графики, както говорихме. В момента не може да се отвори директно, тъй като изисква параметъра studentid, за да зареди информация за съответния студент.

url params: studentid

**script**: user.js



**student\_event\_page.html**

Страницата "мои събития" с всички събития, на които е присъствал студентът. Всяко събитие при кликане води до страницата на събитието в режим студент.

url params: studentid

**script:** events-list.js



**event\_page\_student\_view.html**

Страница за събитието в режим студент. Има бутон с id="show-attending", който при натискане показва списъка с присъствали студенти в div с id="attendance-list". Има и бутон с id="back" за връщане към страницата с всички събития.

url params: studentid; eventid

**script**: event-details.js



**teacher\_page.html**

Страницата "за мен" за преподавател. В момента има възможност за няколко преподавателя, но е hardcode-нат един.

url params: засега няма

**script**: teacher-user.js



**teacher\_event\_page.html**

Страницата "мои събития" на учителя. В примерните данни има събития от различни преподаватели, така че се взимат само тези на текущия (който засега е hardcode-нат). При натискане на събитие отиваме в страницата на това събитие в режим преподавател.

url params: teacherid

**script**: teacher-events-list.js



**event\_page\_teacher\_view.html**

Страница за събитието в режим преподавател. Има бутон с id="show-attending", който при натискане показва списъка с присъствали студенти в div с id="attendance-list". Има и бутон с id="back" за връщане към страницата с всички събития. Има и бутон за добавяне на студенти, засега нефункционален.

url params: teacherid; eventid

**script**: teacher-event-details.js



**teacher\_page\_list\_students.html**

Страницата "студенти" в профила на преподавателя. Показва всички студенти в системата, като има (нефункционален) бутон за добавяне на нов студент. При натискане на студент се отваря страницата "за мен" на този студент в нов таб, като после може да се навигира и до събитията на студента. (в нов таб, защото иначе трябва логика как да се върнем в профила на учителя, но тя не може да е направо в student\_page.html, защото тя може да е отворена от самия студент)(понякога отваря нов таб, понякога нов прозорец, и аз не знам вече).

url params: teacherid

**script**: teacher-students-list.js



За всички файлове съм използвала един css файл:

**page\_styles.css**

Той за жалост е без много коментари.



За опция "статистика" в профила на преподавател още не съм направила страница.



Засега не съм направила страниците за log-in и sign-up. Не съм добавила също секциите ресурси и коментари, както и търсачката.



В скриптовете има повече коментари с пояснения.

