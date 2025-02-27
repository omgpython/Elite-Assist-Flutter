import 'package:elite_assist/model/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../generated/fonts.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});

  List<FaqModel> faqs = [];

  @override
  Widget build(BuildContext context) {
    addFaqs();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
        ),
        title: Text(
          'Frequently Asked Questions',
          style: TextStyle(
            fontFamily: Fonts.BebasNeue,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            return Card(
              child: Theme(
                data: ThemeData(
                  dividerColor: Colors.transparent, // Remove divider
                ),
                child: ExpansionTile(
                  title: Text(
                    "${index + 1}. ${faqs[index].question}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(faqs[index].answer),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void addFaqs() {
    faqs.clear();
    faqs.add(
      FaqModel(
        question: "What services does Elite Assist offer?",
        answer:
            "Elite Assist provides a wide range of professional services, including [list your services like virtual assistance, personal concierge, administrative support, tech assistance, etc.]. We tailor our services to meet your specific needs for both personal and business requirements.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "How can I book a service with Elite Assist?",
        answer:
            "You can book a service easily through our website or by contacting our customer support team. Simply choose the service you need, and our team will get in touch to confirm the details and schedule.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "How much do your services cost?",
        answer:
            "Our pricing depends on the type and complexity of the service you require. We offer transparent pricing and provide a quote upfront so you know exactly what to expect. For customized pricing, feel free to contact us directly.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "Is there a minimum commitment for your services?",
        answer:
            "No, there is no long-term commitment required. We offer flexible plans, whether you need a one-time service or ongoing assistance. Our goal is to provide solutions that fit your schedule and needs.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "Are your services available 24/7?",
        answer:
            "Our all services are available between 10 AM to 8 PM. You can reach out to us during these hours, and we will work with you to fulfill your needs.",
      ),
    );
    faqs.add(
      FaqModel(
        question:
            "How do I know if Elite Assist is the right fit for my needs?",
        answer:
            "We offer a free consultation or introductory session to discuss your needs and determine how our services can best support you. Our team is dedicated to customizing solutions that align with your goals.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "What happens if I need to cancel or reschedule a service?",
        answer:
            "We understand that plans can change. You can reschedule or cancel your service by contacting us in advance. We’ll work with you to find a more convenient time if needed.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "Are your service providers qualified and experienced?",
        answer:
            "Yes! All of our service providers are thoroughly vetted and have significant experience in their respective fields. We ensure they meet the high standards we hold at Elite Assist to guarantee quality service.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "Is my personal information secure when I use your services?",
        answer:
            "At Elite Assist, we prioritize your privacy and security. All personal information is kept confidential, and we follow industry-leading security practices to protect your data.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "Can I request a specific service provider for my tasks?",
        answer:
            "Absolutely! If you’ve worked with a specific provider and would like to request them for future services, we’ll do our best to accommodate that.",
      ),
    );
    faqs.add(
      FaqModel(
        question:
            "How do I contact customer support if I have an issue or question?",
        answer:
            "You can reach our customer support team through phone or email on our application. We’re here to help you with any questions or concerns you may have.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "Do you offer any discounts or loyalty programs?",
        answer:
            "Yes, we offer occasional discounts and special promotions. Additionally, our loyal customers are eligible for exclusive deals. Be sure to check our website or sign up for our newsletter to stay updated!",
      ),
    );
    faqs.add(
      FaqModel(
        question: "How do I provide feedback on the service I received?",
        answer:
            "We appreciate your feedback! After your service is completed, you’ll have the option to leave a review. We encourage you to share your experience, as it helps us improve and ensure the highest quality.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "How do I pay for your services?",
        answer:
            "We accept a variety of payment methods, including credit/debit cards and online payment systems. Payment details will be provided when you book your service, and we ensure that the payment process is safe and easy.",
      ),
    );
    faqs.add(
      FaqModel(
        question: "Can I modify or update my service request after booking?",
        answer:
            "Yes! If you need to modify or update your request, just get in touch with us as soon as possible, and we’ll adjust the service to meet your updated requirements.",
      ),
    );
  }
}
