-- phpMyAdmin SQL Dump
-- version 2.6.1
-- http://www.phpmyadmin.net
-- 
-- Хост: localhost
-- Время создания: Мар 19 2008 г., 18:08
-- Версия сервера: 5.0.45
-- Версия PHP: 5.2.4
-- 
-- БД: `news`
-- 

-- --------------------------------------------------------

-- 
-- Структура таблицы `lenta`
-- 

DROP TABLE IF EXISTS `lenta`;
CREATE TABLE `lenta` (
  `id` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `dateof` datetime NOT NULL,
  `author` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=cp1251 AUTO_INCREMENT=9 ;

-- 
-- Дамп данных таблицы `lenta`
-- 

INSERT INTO `lenta` (`id`, `title`, `msg`, `dateof`, `author`, `image`) VALUES (1, 'Первая новость', 'You create and manipulate your documents and files using various elements such as panels, bars, and windows. Any arrangement of these elements is called a workspace. When you first start an Adobe Creative Suite component, you see the default workspace, which you can customize for the tasks you perform there. For instance, you can create one workspace for editing and another for viewing, save them, and switch between them as you work.', '2008-03-07 12:20:00', 'Василий Пупкин', 'image1.jpg');
INSERT INTO `lenta` (`id`, `title`, `msg`, `dateof`, `author`, `image`) VALUES (2, 'Вторая новость', 'Although default workspaces vary across Flash, Illustrator, InCopy, InDesign, and Photoshop, you manipulate the elements much the same way in all of them. The Photoshop default workspace is typical:', '2008-03-11 09:39:27', 'Семен Пупкин', 'image2.jpg');
INSERT INTO `lenta` (`id`, `title`, `msg`, `dateof`, `author`, `image`) VALUES (3, 'Третья новость', 'The Tools panel (called the Tools palette in Photoshop) contains tools for creating and editing images, artwork, page elements, and so on. Related tools are grouped together.', '2008-03-18 04:29:27', 'Иосиф Пупкин', 'image3.jpg');
INSERT INTO `lenta` (`id`, `title`, `msg`, `dateof`, `author`, `image`) VALUES (4, 'Четвертая новость', 'Panels (called palettes in Photoshop) help you monitor and modify your work. Examples include the Timeline in Flash and the Layers palette in Photoshop. Certain panels are displayed by default, but you can add any panel by selecting it from the Window menu. Many panels have menus with panel-specific options. Panels can be grouped, stacked, or docked.', '2008-03-22 07:49:27', 'Франц Пупкин', 'image4.jpg');
INSERT INTO `lenta` (`id`, `title`, `msg`, `dateof`, `author`, `image`) VALUES (5, 'Пятая новость', 'When rulers show, they appear along the top and left sides of the document. You can change the unit of measure used in the rulers from the default of pixels to another unit. When you move an element on the Stage with the rulers displayed, lines indicating the element’s dimensions appear on the rulers.', '2008-03-03 13:59:27', 'Мганга Пупкин', 'image1.jpg');
INSERT INTO `lenta` (`id`, `title`, `msg`, `dateof`, `author`, `image`) VALUES (6, 'Шестая новость', 'To move a guide, click anywhere on the ruler with the Selection tool and drag the guide to the desired place on the Stage. To remove a guide, use the Selection tool with guides unlocked to drag the guide to the horizontal or vertical ruler.', '2008-03-15 18:39:27', 'Джордж Пупкин', 'image2.jpg');
INSERT INTO `lenta` (`id`, `title`, `msg`, `dateof`, `author`, `image`) VALUES (7, 'Седьмая новость', 'To match the shortcuts you use in other applications, or to streamline your workflow, select keyboard shortcuts. By default, Flash uses built?in keyboard shortcuts designed for the application. You can also select a built?in keyboard shortcut set from one of several graphics applications. ', '2008-03-08 02:09:27', 'Антуан Пупкин', 'image3.jpg');
INSERT INTO `lenta` (`id`, `title`, `msg`, `dateof`, `author`, `image`) VALUES (8, 'Последняя новость', 'Select a name and location for the exported HTML file. The default file name is the name of the selected shortcut set. Click Save. Find the exported file in the folder you selected and open the file in a web browser. ', '2008-03-27 10:22:27', 'Уыыыэх Пупкин', 'image4.jpg');

