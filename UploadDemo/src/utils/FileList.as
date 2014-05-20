package utils
{
    import flash.events.DataEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.FileFilter;
    import flash.net.FileReference;
    import flash.net.FileReferenceList;
    import flash.net.URLRequest;
    
    [Event(name="uploadCompleteData",type="flash.events.DataEvent")]
    [Event(name="ioError",type="flash.events.IOErrorEvent")]
    [Event(name="progress",type="flash.events.ProgressEvent")]
    [Event(name="allComplete",type="flash.events.Event")]
    
    /**
     * ...
     * @author Seven Yu
     */
    public class FileList extends FileReferenceList
    {
        
        public static const ALL_COMPLETE:String = 'allComplete';
        
        private var files:Array;
        private var _errFiles:Array;
        
        public function FileList()
        {
            init();
        }
        
        private function init():void
        {
            this.addEventListener(Event.SELECT, selectHandler);
            this.addEventListener(Event.CANCEL, cancelHandler);
        }
        
        private function selectHandler(e:Event):void
        {
            var fl:Array = this.fileList;
            files = [];
            _errFiles = [];
            for (var i:int = 0, l:int = fl.length; i < l; i++)
            {
                appendFile(fl[i]);
            }
        }
        
        private function cancelHandler(e:Event):void
        {
            trace('canceled...');
        }
        
        private function appendFile(file:FileReference):void
        {
            trace('append file:', file.name);
            files.push(file);
            file.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            file.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, completeHandler);
            file.upload(new URLRequest('http://192.168.1.199/php/labs/1209c/upload/upload.php'), 'user_file');
        }
        
        private function errorHandler(e:IOErrorEvent):void
        {
            trace(e);
            dispatchEvent(e.clone());
            _errFiles.push(e.target);
        }
        
        private function progressHandler(e:ProgressEvent):void
        {
            trace(e.bytesLoaded, e.bytesTotal);
            dispatchEvent(e.clone());
        }
        
        private function completeHandler(e:DataEvent):void
        {
            var file:FileReference = e.target as FileReference;
            removeFile(file);
            dispatchEvent(e.clone());
            
            var result:Object = JSON.parse(e.data);
            
            if (result.code > 0)
            {
                _errFiles.push(file);
            }
            
            if (files.length == 0)
            {
                dispatchEvent(new Event(ALL_COMPLETE));
            }
        }
        
        private function removeFile(file:FileReference):void
        {
            var ind:int = files.indexOf(file);
            if (ind !== -1)
            {
                files.splice(ind, 1);
            }
        }
        
        public static function get ImageFilter():FileFilter
        {
            return new FileFilter('Image files (*.jpg, *.jpeg, *.png, *.gif)', '*.jpg; *.jpeg; *.png; *.gif');
        }
        
        public static function get TextFilter():FileFilter
        {
            return new FileFilter('Text files (*.txt, *.xml, *.json, *.log)', '*.txt; *.xml; *.json; *.log');
        }
        
        public function get errFiles():Array 
        {
            return _errFiles;
        }
    
    }

}