#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <sys/inotify.h>

/* size of the event structure, not counting name */
#define EVENT_SIZE (sizeof (struct inotify_event))

/* reasonable guess as to size of 1024 events */
#define BUF_LEN (1024 * (EVENT_SIZE + 16))

int main(int argc, char* argv[])
{
    int fd;
    char buf[BUF_LEN];
    int len, i = 0;

    fd = inotify_init();

    if (fd < 0)
        fprintf(stderr, "ERROR: inotify_init\n");

    int wd;

    wd = inotify_add_watch(fd,
                           "/tmp/device/android-device-log.txt",
                           IN_MODIFY | IN_CREATE | IN_DELETE | IN_ATTRIB | IN_CLOSE_WRITE | IN_ALL_EVENTS);

    if (wd < 0)
        fprintf(stderr, "ERROR: inotify_add_watch\n");

    len = read (fd, buf, BUF_LEN);

    if (len < 0) {
        if (errno == EINTR)
            fprintf(stderr, "need to reissue system call\n");
        else
            perror ("read");
    }
    else if (!len) {
        // BUF_LEN too small?

        while (i < len) {
            struct inotify_event *event;

            event = (struct inotify_event *) &buf[i];

            printf ("wd=%d mask=%u cookie=%u len=%u\n",
                    event->wd, event->mask,
                    event->cookie, event->len);

            if (event->len)
                printf ("name=%s\n", event->name);

            i += EVENT_SIZE + event->len;
        }
    }

    return 0;
}
