<?php

namespace Application\Model;

use RuntimeException;
use Zend\Db\TableGateway\TableGatewayInterface;
use Zend\Db\Sql\Select;

class GuestTable
{
    private $tableGateway;

    public function __construct(TableGatewayInterface $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = new Select('guestbook');
        $select->columns(array('id', 'email', 'text', 'timestamp'));
        $select->order('timestamp DESC');
        $resultSet = $this->tableGateway->selectWith($select);
        return $resultSet;
    }

    public function getGuest($id)
    {
        $id = (int)$id;
        $rowset = $this->tableGateway->select(['id' => $id]);
        $row = $rowset->current();
        if (!$row) {
            throw new RuntimeException(
                sprintf(
                    'Could not find row with identifier %d',
                    $id
                )
            );
        }
        return $row;
    }

    public function saveGuest(Guest $guestbook)
    {
        $data = [
            'email' => $guestbook->email,
            'text' => $guestbook->text,
            'timestamp' => $guestbook->timestamp,
        ];

        $id = (int)$guestbook->id;

        if ($id === 0) {
            $this->tableGateway->insert($data);
            return;
        }
        try {
            $this->getGuest($id);
        } catch (RuntimeException $e) {
            throw new RuntimeException(
                sprintf(
                    'Cannot update guestbook with identifier %d; does not exist',
                    $id
                )
            );
        }

        $this->tableGateway->update($data, ['id' => $id]);
    }

    public function deleteGuest($id)
    {
        $this->tableGateway->delete(['id' => (int)$id]);
    }
}