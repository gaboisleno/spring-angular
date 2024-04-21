import { Component, OnInit } from '@angular/core';
import { LoadingService } from '../../services/loading.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  standalone: true,
})
export class HomeComponent implements OnInit {
  constructor(private loadingService: LoadingService) {}

  ngOnInit(): void {
    this.loadingService.display(false);
  }
}
