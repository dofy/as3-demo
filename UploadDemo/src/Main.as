package
{
    import flash.display.Sprite;
    import flash.events.DataEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.MouseEvent;
    import flash.events.ProgressEvent;
    import flash.external.ExternalInterface;
    import flash.net.FileReference;
    import flash.net.FileReferenceList;
    import flash.net.URLRequest;
    import ui.MyButton;
    import utils.FileList;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var btnUpload:MyButton;
        private var frl:FileReferenceList;
        
        public function Main():void
        {
            if (stage)
                init();
            else
                addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            // entry point
            
            btnUpload = new MyButton('上传文件...');
            addChild(btnUpload);
            btnUpload.addEventListener(MouseEvent.CLICK, clickHandler);
            
            frl = new FileReferenceList();
            frl.addEventListener(Event.SELECT, selectHandler);
            frl.addEventListener(Event.CANCEL, cancelHandler);
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            frl.browse([FileList.ImageFilter]);
        }
        
        private function selectHandler(e:Event):void
        {
            var files:Array = frl.fileList;
            log('开始上传文件(' + files.length + ')');
            for (var i:int = 0, file:FileReference; i < files.length; i++)
            {
                file = files[i];
                log('上传 ' + file.name);
                file.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
                file.addEventListener(ProgressEvent.PROGRESS, progressHandler);
                file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, completeHandler);
                file.upload(new URLRequest('http://192.168.1.199/php/labs/1209c/upload/upload.php'), 'user_file');
            }
        }
        
        private function cancelHandler(e:Event):void
        {
            trace('canceled...');
            log('取消...');
        }
        
        private function errorHandler(e:IOErrorEvent):void
        {
            log(e.text);
        }
        
        private function progressHandler(e:ProgressEvent):void
        {
            var file:FileReference = (e.target as FileReference);
            progress(file.name, e.bytesLoaded, e.bytesTotal);
        }
        
        private function completeHandler(e:DataEvent):void
        {
            var file:FileReference = (e.target as FileReference);
            var result:Object = JSON.parse(e.data);
            if (result.code == 0)
            {
                log('文件' + file.name + '上传成功...');
            }
            else
            {
                log('文件' + file.name + '上传失败... (' + result.msg + ')');
            }
        }
        
        private function log(msg:String):void
        {
            //ExternalInterface.call('uploadLog', msg);
        }
        
        private function progress(f:String, l:int, t:int):void
        {
            //ExternalInterface.call('progressLog', f, l, t);
        }
    
    }

}