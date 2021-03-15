<?php

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Application\Model\Guest;
use Application\Model\GuestTable;
use Application\Form\GuestForm;

class GuestController extends AbstractActionController
{
    private $albumTable;

    public function __construct(GuestTable $albumTable)
    {
        $this->albumTable = $albumTable;
    }

    public function indexAction()
    {
        $tb = $this->albumTable->getGuest(1);

        $form = new GuestForm();
        $form->get('submit')->setValue('Add');
        $request = $this->getRequest();


        if ($request->isPost()) {
            $guest = new Guest();
            $form->setInputFilter($guest->getInputFilter());
            $form->setData($request->getPost());

            if ($form->isValid()) {
                $guest->exchangeArray($form->getData());
                $this->albumTable->saveGuest($guest);


                return $this->redirect()->toRoute('guest');
            }
        }
        $view = new ViewModel(
            [
                'data' => $this->albumTable->fetchAll(),
                'form' => $form,
            ]
        );
        return $view;
    }
}