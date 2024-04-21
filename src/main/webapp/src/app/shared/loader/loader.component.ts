import { Component, OnInit } from '@angular/core';
import { LoadingService } from '../../services/loading.service';

@Component({
  selector: 'app-loader',
  templateUrl: './loader.component.html',
  styleUrls: ['./loader.component.css'],
  standalone: true,
})
export class LoaderComponent implements OnInit {
  isLoading: boolean = false;
  constructor(private loadingService: LoadingService) {}

  ngOnInit(): void {
    this.loadingService.isLoading.subscribe((val: boolean) => {
      console.log(val);
      this.isLoading = val;
    });
  }
}
