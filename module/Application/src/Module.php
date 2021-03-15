<?php
/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Album\Model\Album;
use Album\Model\AlbumTable;
use Application\Model\Guest;
use Application\Model\GuestTable;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\ModuleManager\Feature\ConfigProviderInterface;

class Module implements ConfigProviderInterface
{
    const VERSION = '3.1.3';

    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }

    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                GuestTable::class => function($sm) {
                    $tableGateway = $sm->get('GuestTableGateway');
                    $table = new GuestTable($tableGateway);
                    return $table;
                },
                'GuestTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Guest());
                    return new TableGateway('guestbook', $dbAdapter, null, $resultSetPrototype);
                },
            ),
        );
    }
}
