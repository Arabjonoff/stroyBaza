package us.usg.stroy_baza
import io.flutter.embedding.android.FlutterActivity
import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("4c8cade0-fb68-4f86-ae24-5728bbb9b2d6") // Your generated API key
    }
}