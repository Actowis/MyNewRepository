//
//  ViewController.swift
//  EmailWithPhotoWordPdf
//
//  Created by Nilam Monpura on 25/10/21.
//

import UIKit
import MessageUI
import Foundation

class ViewController: UIViewController,MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        /*  if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self;
                mail.setCcRecipients(["nmonpura@actowis.com"])
                mail.setSubject("Send Image")
                mail.setMessageBody("Message", isHTML: false)
                  
              
              let img = UIImage(named: "Dada")
              let imageData: NSData = (img?.pngData()!)! as NSData
                  //UIImagePNGRepresentation(imageView.image)!
               mail.addAttachmentData(imageData as Data, mimeType: "image/png", fileName: "Dada.png")
               self.present(mail, animated: true, completion: nil)
              }
          else
          {
              print("Not Send")
          }*/
        // Do any additional setup after loading the view.
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        switch (result.rawValue) {
                   case MessageComposeResult.cancelled.rawValue:
                   print("Message was cancelled")
                   self.dismiss(animated: true, completion: nil)
               case MessageComposeResult.failed.rawValue:
                   print("Message failed")
                   self.dismiss(animated: true, completion: nil)
               case MessageComposeResult.sent.rawValue:
                   print("Message was sent")
                   self.dismiss(animated: true, completion: nil)
               default:
                   break;
               }
    }
    @IBAction func btnSMSClicked(_ sender: Any)
    {
        guard MFMessageComposeViewController.canSendText() else {
                  return
                    print("Error")
              }

              let messageVC = MFMessageComposeViewController()

              messageVC.body = "Enter a message";
              messageVC.recipients = ["9016972170"]
              messageVC.messageComposeDelegate = self;

              self.present(messageVC, animated: false, completion: nil)

    }
    @IBAction func btnEmailClicked(_ sender: Any)
    {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self;
        mail.setCcRecipients(["nmonpura@actowis.com"])
        mail.setSubject("Send Image")
        mail.setMessageBody("Message", isHTML: false)
          
        if MFMailComposeViewController.canSendMail()
        {
            self.present(mail, animated: true, completion: nil)
        }
       /* let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail()
            {
                self.present(mailComposeViewController, animated: true, completion: nil)
             }
            else
            {
                print("Error"
            }*/
                
      }
        func configuredMailComposeViewController() -> MFMailComposeViewController
        {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
    
              mailComposerVC.setToRecipients(["nmonpura@actowis.com"])
              mailComposerVC.setSubject("Sending you an in-app e-mail...")
               mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
       
               return mailComposerVC
        }
        func showSendMailErrorAlert()
        {
            print("Error")
//              let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
//              sendMailErrorAlert.show()
           }
    private func mailComposeController(controller: MFMailComposeViewController,
        didFinishWithResult result: MFMailComposeResult, error: NSError?)
    {
        print(result)
        controller.dismiss(animated: true, completion: nil)
    }
}


