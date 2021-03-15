<?php

namespace Application\Form;

use Zend\Form\Form;
use Zend\Form\Element;
use Zend\Math\Rand;

class GuestForm extends Form
{

    public function __construct($name = null)
    {
        parent::__construct('guest');
        $this->add(
            array(
                'name' => 'id',
                'type' => 'Hidden',
            )
        );
        $this->add(
            array(
                'name' => 'timestamp',
                'type' => 'Hidden',
            )
        );
        $this->add(
            array(
                'name' => 'email',
                'type' => 'Email',
                'options' => array(
                    'label' => 'Электронная почта',
                ),
            )
        );
        $this->add(
            [
                'type' => Element\Csrf::class,
                'name' => 'security',
                'options' => [
                    'csrf_options' => [
                        'timeout' => 600,
                    ],
                ],
            ]
        );
        $this->add(
            array(
                'name' => 'text',
                'type' => 'Text',
                'options' => array(
                    'label' => 'Текст сообщения',
                ),
            )
        );
        $this->add(
            array(
                'name' => 'submit',
                'type' => 'Submit',
                'attributes' => array(
                    'value' => 'Go',
                    'id' => 'submitbutton',
                ),
            )
        );
    }
}