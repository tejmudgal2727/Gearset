trigger AvoidDuplicate on Account(Before insert)
{

    for(Account a1 : [select Id , name from Account])
    {
    for(Account a : Trigger.new)
    {
    if(a.name == a1.name)
    {
    a.name.addError('This Account Name is Already present ');
}
}
}
}