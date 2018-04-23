
# String-SubString
Create your own class, input -> should be string, output -> method, should be return array of substrings.</br>
output method -> get all the substrings between the open-close tags: "(", ")", "[", "]", "<", ">" from the string</br>

<b>Details:</b></br>
- in your class you can have only one method (output method)</br>
- instead of additional methods, you should create and use blocks</br>
- blocks can be as many as you want</br>
- use MRC</br>
- your code shouldn't have leak. (Check your code on - Liak. Your code shouldn't have - Leak, use for that suitable tool)</br>

<b>Test data strings:</b></br>
<i>String:</i></br>
@"Prime Minister \<Narendra Modi\> tweeted a \<link\> to the speech (Human Resource Development Minister Smriti Irani) \<made\> in the Lok Sabha during the ((debate) on the ongoing JNU row) and the suicide of Dalit scholar Rohith Vemula at the [Hyderabad Central University]."</br> 
<i>Result:</i>  
-> "Narendra Modi", "link", "Human Resource Development Minister Smriti Irani", "made", "debate", "(debate) on the ongoing JNU row", "Hyderabad Central University"</br></br>
<i>String:</i></br>
@"Lorem \<(ipsum [dolor \<sit] amet), consectetur adipiscing elit\>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet\>. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget (nulla. Class aptent \<taciti [sociosqu ad] litora torquent per conubia\> nostra), per inceptos himenaeos."</br>
<i>Result:</i>  
-> "(ipsum [dolor <sit] amet), consectetur adipiscing elit>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet", "ipsum [dolor <sit] amet", "sit] amet), consectetur adipiscing elit", "dolor <sit", "nulla. Class aptent <taciti [sociosqu ad] litora torquent per conubia> nostra", "taciti [sociosqu ad] litora torquent per conubia", "sociosqu ad"</br>
>>>>>>> 3cddf295d1a9a894356b7d40c428a14827fd75fb
