import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Privacypage extends StatelessWidget {
  const Privacypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Privacy & Policy'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Privacy policy',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('brototype built the Music_player app as a Free app.'),
                  ],
                ),
                Row(
                  children: const [
                    Text('This SERVICE is provided by brototype at no cost,'),
                  ],
                ),
                Row(
                  children: const [Text('and is intended for use as is.')],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('information colection and use',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('For a better experience, while using our Service, we')
                  ],
                ),
                Row(
                  children: const [
                    Text(
                        'may require you to provide us with certain personally')
                  ],
                ),
                Row(
                  children: const [
                    Text('identifiable information. The information that we')
                  ],
                ),
                Row(
                  children: const [
                    Text(
                        ' request will be retained by us and used as described')
                  ],
                ),
                Row(
                  children: const [Text('in this privacy policy')],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.remove,
                    ),
                    TextButton(
                        onPressed: () {
                          launchUrl(
                              Uri.parse('https://policies.google.com/privacy'));
                        },
                        child: Text('Goolgle play Service',style: TextStyle(color: Colors.blue.shade300)))
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.remove),
                    TextButton(
                        onPressed: () {
                          launchUrl(Uri.parse(
                              'https://www.facebook.com/about/privacy/update/printable'));
                        },
                        child:  Text('Facebook',style: TextStyle(color: Colors.blue.shade300)))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Log Data',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('We want to inform you that whenever you use our,')
                  ],
                ),
                Row(
                  children: const [
                    Text('service in a case of an error in the app we collect,')
                  ],
                ),
                Row(
                  children: const [
                    Text('data and information (through third-party products)')
                  ],
                ),
                Row(
                  children: const [
                    Text('on your phone called Log Data,this may include ')
                  ],
                ),
                Row(
                  children: const [
                    Text('internet protocol(ip)adress(ip)adress device name,')
                  ],
                ),
                Row(
                  children: const [
                    Text('operating sytem version, the configration of the app')
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Cookies',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('Cookies are files with a small amount of data that')
                  ],
                ),
                Row(
                  children: const [
                    Text('are commonly used as anonymous unique')
                  ],
                ),
                Row(
                  children: const [
                    Text('identifiers.These are sent to your browser')
                  ],
                ),
                Row(
                  children: const [
                    Text(' from the websites that you visit and are stored ')
                  ],
                ),
                Row(
                  children: const [
                    Text('on your devices stored on your devices')
                  ],
                ),
                Row(
                  children: const [Text(' internal memory')],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Service Providers',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text('We may employ third party companies and')
                  ],
                ),
                Row(
                  children: const [
                    Text('  individuals due to the following resons;')
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: const [Text('To facilitate our Service;')],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: const [
                    Text('To provide the Service on our behalf;')
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: const [
                    Text('To perform Service-related services; or')
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: const [
                    Text('To assist us in analyzing how our service is used;')
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: const [
                    Text('We want to inform users of this Service that these')
                  ],
                ),
                Row(
                  children: const [
                    Text('third parties have access to their Personal')
                  ],
                ),
                Row(
                  children: const [Text('information')],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Security',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('We value your trust in providing us your Personal')
                  ],
                ),
                Row(
                  children: const [
                    Text('Information, thus we are striving to use ')
                  ],
                ),
                Row(
                  children: const [
                    Text('commercially acceptable means of protecting it.')
                  ],
                ),
                Row(
                  children: const [
                    Text('But remember that no method of transmission over ')
                  ],
                ),
                Row(
                  children: const [
                    Text('the internet,or method of electric storage is 100%')
                  ],
                ),
                Row(
                  children: const [
                    Text(' secure and reliable,and we cannot gurantee')
                  ],
                ),
                Row(
                  children: const [Text('its absolute security')],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Changes to This Privacy Policy',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('We may update our Privacy Policy from time to time.')
                  ],
                ),
                Row(
                  children: const [
                    Text('Thus, you are advised to review this page ')
                  ],
                ),
                Row(
                  children: const [
                    Text('periodically for any changes. We will notify you ')
                  ],
                ),
                Row(
                  children: const [
                    Text('of any changes by posting the new Privacy ')
                  ],
                ),
                Row(
                  children: const [
                    Text('Policy on this page. This policy is effective')
                  ],
                ),
                Row(
                  children: const [Text('as of 2022-06-13')],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Contact us',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('If you have any questions or suggestions about our')
                  ],
                ),
                Row(
                  children: const [
                    Text(' Privacy Policy, do not hesitate to contact us at')
                  ],
                ),
                Row(
                  children: const [Text('imnoble17@gmail.com.')],
                ),
                Row(
                  children: const [
                    Text('This privacy policy page was created at ')
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          launchUrl(Uri.parse(
                              'https://www.privacypolicytemplate.net/'));
                        },
                        child: Text('privacypolicytemplate.net',style: TextStyle(color: Colors.blue.shade300)))
                  ],
                ),
                Row(
                  children: const [Text('and modified/generated by ')],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          launchUrl(Uri.parse(
                              'https://app-privacy-policy-generator.nisrulz.com/'));
                        },
                        child:  Text('App Privacy Policy Generator',style: TextStyle(color: Colors.blue.shade300),))
                  ]
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
