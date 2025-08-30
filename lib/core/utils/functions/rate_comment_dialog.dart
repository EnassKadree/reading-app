part of 'functions.dart';

Future<void> showReadingExitDialog({
  required BuildContext context,
  required String bookTitle,
  required VoidCallback onRatePressed,
  required VoidCallback onExitAnyway,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child:Lottie.asset(AssetsConsts.successLottie)
              ),
              const SizedBox(height: 20),
              Text(
                "congratulations".t(context),
                style: TextStyle(
                  color:Colors.green[300],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "progressMessage".t(context),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:context.colorScheme.onPrimary,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onRatePressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colorScheme.surfaceContainer,
                        foregroundColor: Colors.deepPurple,
                        side: BorderSide(color:Colors.amber[500]! ,width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child:  Text("rate".t(context),style: TextStyle(color: context.colorScheme.onPrimary),),
                    ),
                  ),
                  12.spaceW,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onExitAnyway,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colorScheme.surfaceContainer,
                        foregroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),

                        ),
                        side: BorderSide(color:Colors.green[300]!,width:2 ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child:  Text('exit'.t(context),style: TextStyle(color: context.colorScheme.onPrimary)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
