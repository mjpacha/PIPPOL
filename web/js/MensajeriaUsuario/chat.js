

function ChatWidget(pusher){
     
    var self=this;
    this.pusher=pusher;
    this.channelName='chat';
    this.chatContainer=$('.chat-widget');
    this.messageContainer=$('.chat-messages');
    this.chatName=$('.chat-name');
    this.chatEntry=$('.chat-entry');
    this.channel=this.pusher.subscribe(this.channelName);
    this._latestMessages();
    

    
    this.channel.bind('new-message',function(data){    
         self._displayMessage(data);
    });
  
     this.chatEntry.keydown(function(e){       
        if(e.keyCode === 13) {
          e.preventDefault();
          self._sendMessage({
            name: self.chatName.val(),
            message: self.chatEntry.val()
                 
          });
          self.chatEntry.val("");
        }  
    });
    
};

ChatWidget.prototype._latestMessages=function(){
   var self=this;
   
   $.ajax({
       url:'mensajes',
        dataType: 'json',
        type: 'get',
        success: function (data) {
            $.each(data,function(i,message){
                self._displayMessage(message);
                
            });
        }
       
   });
 };
 
 ChatWidget.prototype._displayMessage=function (message){
     
     var m=' <li class="left clearfix"><span class="chat-img pull-left"><img src="http://www.pulso.uniovi.es/wiki/images/e/eb/Mario_SM3DW.png" width="25" height="25"/></span><div class="chat-body clear-fix"><div class="header"><strong class="primary-font">'+message.id_user+'</strong><small class="pull-right text-muted"><span class="glyphicon glyphicon-time"></span>'+message.time_mess+'</small></div><p>'+message.emi_mess+'</p></div></li>';
     this.messageContainer.prepend(m);     
};


 ChatWidget.prototype._sendMessage=function(message){
   $.ajax({
       url:'NuevoMensajeControl',
       type: 'post',
       data:{
           message: message.message,
           name: message.name
       },
       success: function(data){
    
       }
   });    
 };
 
 ChatWidget.prototype._emoji=function(){
         ($('.chat-entr5y')).emojioneArea({
                pickerPosition: "up"
            });
 };