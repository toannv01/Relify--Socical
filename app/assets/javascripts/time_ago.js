var time_ago_in_words = function(from, to) {
 to = to ? to : Date.now();

var minutes = (to - from) / 60000;

var data = [
 [0 , 'less than a minute ago'],
 [1 , 'a minute ago'],
 [2 , function(m) {return m.toFixed() + ' minutes ago';}],
 [45 , 'about 1 hour ago'],
 [90 , function(m) {return 'about ' + (m / 60).toFixed() + ' hours ago';}],
 [1440 , '1 day ago'],
 [2880 , function(m) {return (m / 1440).toFixed() + ' days ago';}],
 [43200 , 'about 1 month ago'],
 [86400 , function(m) {return (m / 43200).toFixed() + ' months ago';}],
 [52960 , 'about 1 year ago'],
 [1051200, function(m) {return (m / 525960).toFixed() + ' years ago';}],
 [Number.MAX_VALUE]
];

function b_search(value, lower, pos, upper) {
 if (data[pos][0] <= value && value < data[pos + 1][0])
  return data[pos];
 else if (value < data[pos][0])
  return b_search(value, lower, Math.floor((lower + pos - 1) / 2), pos - 1);
 else
  return b_search(value, pos + 1, Math.floor((pos + 1 + upper) / 2), upper);
}

var res = b_search(minutes, 0, Math.floor((data.length - 1) / 2), data.length - 1)[1];
 return (res instanceof Function) ? res(minutes) : res;
};