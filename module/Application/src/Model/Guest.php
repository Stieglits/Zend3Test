<?php

namespace Application\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class Guest
{
    public $id;
    public $email;
    public $text;
    public $name;

    public function exchangeArray(array $data)
    {
        $this->id = !empty($data['id']) ? $data['id'] : null;
        $this->email = !empty($data['email']) ? $data['email'] : null;
        $this->text = !empty($data['text']) ? $data['text'] : null;
        $this->name = !empty($data['name']) ? $data['name'] : null;
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function __construct()
    {
        $this->timestamp = (new \DateTime())->format('Y-m-d H:i:s');
    }

    public function getInputFilter()
    {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();
            $inputFilter->add(
                array(
                    'name' => 'id',
                    'required' => true,
                    'filters' => array(
                        array('name' => 'Int'),
                    ),
                )
            );
            $inputFilter->add(
                array(
                    'name' => 'email',
                    'required' => true,
                    'filters' => array(
                        array('name' => 'StripTags'),
                        array('name' => 'StringTrim'),
                    ),
                    'validators' => array(
                        array(
                            'name' => 'StringLength',
                            'options' => array(
                                'encoding' => 'UTF-8',
                                'min' => 1,
                                'max' => 50,
                            ),
                        ),
                    ),
                )
            );
            $inputFilter->add(
                array(
                    'name' => 'text',
                    'required' => true,
                    'filters' => array(
                        array('name' => 'StripTags'),
                        array('name' => 'StringTrim'),
                    ),
                    'validators' => array(
                        array(
                            'name' => 'StringLength',
                            'options' => array(
                                'encoding' => 'UTF-8',
                                'min' => 1,
                                'max' => 50,
                            ),
                        ),
                    ),
                )
            );
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}