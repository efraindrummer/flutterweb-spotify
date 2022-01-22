import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spotify_ui/models/current_track_model.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            _MoreControls()
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurentTrackModel>().selected;
    if(selected == null) return const SizedBox.shrink();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'assets/lofigirl.jpg', 
          height: 60.0, 
          width: 60.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Column(
          children: <Widget>[
            Text(selected.title, style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 4.0),
            Text(selected.artist, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey[300], fontSize: 12.0),)
          ],
        ),
        const SizedBox(width: 12.0),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.favorite_border),
        )
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurentTrackModel>().selected;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.shuffle),
              iconSize: 20.0,
              onPressed: (){},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_previous_outlined),
              iconSize: 20.0,
              onPressed: (){},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.play_circle_outline),
              iconSize: 20.0,
              onPressed: (){},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_next_outlined),
              iconSize: 20.0,
              onPressed: (){},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.repeat),
              iconSize: 20.0,
              onPressed: (){},
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.caption),
            const SizedBox(width: 8.0),
            Container(
              height: 5.0, 
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5)
              ),
            ),
            const SizedBox(width: 8.0),
            Text(selected?.duration ?? '0:00', style: Theme.of(context).textTheme.caption)
          ],
        )
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.devices_outlined),
          iconSize: 20.0,
          onPressed: (){},
        ),
        Row(
          children: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.volume_up)),
            Container(
              height: 5.0, 
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(
                  2.5
                )
              ),
            )
          ],
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen_outlined),
          iconSize: 20.0,
          onPressed: (){},
        ),
      ],
    );
  }
}