package nicegame.ui
{
    import flash.events.Event;
    import flash.events.FileListEvent;
    import flash.events.MouseEvent;
    import flash.filesystem.File;
    import flash.media.ID3Info;
    import flash.net.FileFilter;
    import flash.net.SharedObject;
    import game.ui.MainWinUI;
    import morn.core.components.Component;
    import morn.core.components.Label;
    import morn.core.handlers.Handler;
    import nicegame.events.PlayerEvent;
    import nicegame.media.MyFile;
    import nicegame.media.MyPlayer;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class MainWin extends MainWinUI
    {
        
        private var file:File;
        
        private var so:SharedObject;
        
        private var files:Array;
        
        private var curIndex:int;
        
        private var player:MyPlayer;
        
        public function MainWin()
        {
            init();
            bindEvents();
        }
        
        private function init():void
        {
            player = new MyPlayer();
            
            file = File.documentsDirectory;
            fileList.renderHandler = new Handler(renderHandler);
            
            lblTitle.text = '请选择文件...';
            //lblTime.text = '00:00';
            
            btnPlay.disabled = true;
            
            so = SharedObject.getLocal('files');
            
            readFiles();
        }
        
        private function readFiles():void
        {
            curIndex = -1;
            files = so.data.files || [];
            fileList.array = files;
        }
        
        private function writeFiles():void
        {
            so.data.files = files;
            so.flush();
        }
        
        private function bindEvents():void
        {
            btnPrev.addEventListener(MouseEvent.CLICK, prevHandler);
            btnNext.addEventListener(MouseEvent.CLICK, nextHandler);
            btnPlay.addEventListener(MouseEvent.CLICK, playHandler);
            
            btnAdd.addEventListener(MouseEvent.CLICK, addFileHandler);
            btnDel.addEventListener(MouseEvent.CLICK, delFileHandler);
            sldVol.addEventListener(Event.CHANGE, volHandler);
            
            player.addEventListener(PlayerEvent.ID3, onID3);
            player.addEventListener(PlayerEvent.PLAY, onResume);
            player.addEventListener(PlayerEvent.PAUSE, onPause);
            player.addEventListener(PlayerEvent.RESUME, onResume);
            player.addEventListener(PlayerEvent.COMPLETE, onComplete);
            player.addEventListener(PlayerEvent.PROGRESS, onProgress);
            player.addEventListener(PlayerEvent.VOL_CHANGED, onVolChanged);
            
            player.addEventListener(PlayerEvent.ERROR, onError);
            
            file.addEventListener(FileListEvent.SELECT_MULTIPLE, selectFilesHandler);
            
            fileList.addEventListener(Event.SELECT, selectItemHandler);
        }
        
        private function onError(e:PlayerEvent):void
        {
            lblTitle.text = e.data.toString();
            delFileHandler(null);
        }
        
        private function onProgress(e:PlayerEvent):void
        {
            progressBar.value = e.data as Number;
            lblTime.text = formatTime(player.pos) + '/' + formatTime(player.length);
        }
        
        private function onComplete(e:PlayerEvent):void
        {
            nextHandler(null);
        }
        
        private function onID3(e:PlayerEvent):void
        {
            var info:ID3Info = e.data as ID3Info;
        }
        
        private function volHandler(e:Event):void
        {
            player.vol = Math.abs(sldVol.value);
        }
        
        private function onVolChanged(e:PlayerEvent):void
        {
            //sldVol.value = -(e.data as Number);
        }
        
        private function prevHandler(e:MouseEvent):void
        {
            curIndex--;
            if (curIndex < 0)
            {
                curIndex = files.length - 1;
            }
            gotoFile();
        }
        
        private function nextHandler(e:MouseEvent):void
        {
            curIndex++;
            if (curIndex >= files.length)
            {
                curIndex = 0;
            }
            gotoFile();
        }
        
        private function gotoFile():void
        {
            fileList.selectedIndex = -1;
            fileList.selectedIndex = curIndex;
        }
        
        private function onPause(e:PlayerEvent):void
        {
            btnPlay.label = '>';
        }
        
        private function onResume(e:PlayerEvent):void
        {
            btnPlay.label = 'II';
        }
        
        private function formatTime(length:Number):String
        {
            var leng:int = Math.round(length / 1000);
            var s:int = leng % 60;
            var m:int = Math.floor(leng / 10);
            
            var result:String = '';
            
            if (m < 10)
            {
                result += '0';
            }
            
            result += m + ':';
            
            if (s < 10)
            {
                result += '0';
            }
            result += s;
            
            return result;
        }
        
        private function playHandler(e:MouseEvent):void
        {
            if (player.isPause)
            {
                player.resume();
            }
            else
            {
                player.pause();
            }
        }
        
        private function selectFilesHandler(e:FileListEvent):void
        {
            for each (var f:File in e.files)
            {
                files.push(new MyFile(f.url, f.name));
            }
            fileList.array = files;
            
            writeFiles();
        }
        
        private function addFileHandler(e:MouseEvent):void
        {
            file.browseForOpenMultiple('选择 Mp3 文件', [new FileFilter('Mp3 文件', '*.mp3')]);
        }
        
        private function delFileHandler(e:MouseEvent):void
        {
            files.splice(curIndex, 1);
            fileList.array = files;
            
            writeFiles();
            
            if (curIndex >= files.length)
            {
                curIndex = files.length - 1;
            }
            gotoFile();
        }
        
        private function selectItemHandler(e:Event):void
        {
            if (fileList.selectedIndex < 0)
            {
                lblTitle.text = '请选择文件...';
                btnPlay.disabled = true;
                player.stop();
                return;
            }
            
            btnPlay.disabled = false;
            var f:MyFile = MyFile.parse(files[fileList.selectedIndex]);
            player.play(f.url);
            lblTitle.text = f.name;
            curIndex = fileList.selectedIndex;
        }
        
        private function renderHandler(item:Component, index:int):void
        {
            if (index < files.length)
            {
                var mpIndex:Label = item.getChildByName('mpIndex') as Label;
                var mpName:Label = item.getChildByName('mpName') as Label;
                
                mpIndex.text = index + 1 + '.';
                mpName.text = files[index].name;
            }
        }
    
    }

}