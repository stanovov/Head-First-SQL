CREATE TABLE `toys` (
  `toy_id` int(11) default NULL,
  `toy` varchar(20) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('1','hula hoop');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('2','balsa glider');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('3','toy soldiers');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('4','harmonica');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('5','baseball cards');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('6','tinker toys');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('7','etch-a-sketch');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('8','slinky');

SELECT
	g.girl AS girl,
    t.toy AS toy
FROM
	girls AS g
		LEFT OUTER JOIN toys AS t
        ON g.toy_id = t.toy_id;
        
SELECT
	g.girl AS girl,
	t.toy AS toy
FROM
	toys AS t
		LEFT OUTER JOIN girls AS g
        ON t.toy_id = g.toy_id;