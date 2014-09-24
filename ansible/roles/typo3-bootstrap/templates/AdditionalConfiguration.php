<?php
$GLOBALS['TYPO3_CONF_VARS']['DB']['host'] = 'localhost';
$GLOBALS['TYPO3_CONF_VARS']['DB']['database'] = '{{ database_name }}';
$GLOBALS['TYPO3_CONF_VARS']['DB']['username'] = 'root';
$GLOBALS['TYPO3_CONF_VARS']['DB']['password'] = '{{ mysql_root_password }}';
$GLOBALS['TYPO3_CONF_VARS']['BE']['installToolPassword'] = md5('12345');
$GLOBALS['TYPO3_CONF_VARS']['FE']['debug'] = '1';
